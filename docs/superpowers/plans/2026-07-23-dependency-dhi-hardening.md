# Dependency and DHI Hardening Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Update safe Go dependencies, require the patched Go toolchain, move the statically linked controller to a DHI runtime, modernize Proxmox permission documentation, and resolve verified static-analysis findings.

**Architecture:** Keep the Debian/glibc node runtime because it packages native filesystem and device-management tools, while moving only the `CGO_ENABLED=0` controller to DHI Static. Preserve the two compatible Proxmox API module pins, use `go mod tidy` to derive the indirect graph, and limit issue-derived implementation to documentation fixes with current authoritative provider syntax.

**Tech Stack:** Go 1.26.5, Docker BuildKit, Docker Hardened Images, Helm documentation, Terraform/OpenTofu HCL, Staticcheck, Govulncheck.

## Global Constraints

- Keep `github.com/luthermonson/go-proxmox` at `v0.5.1`.
- Keep `github.com/sergelogvinov/go-proxmox` at `v0.2.0`.
- Keep the CSI node and tools stages on Debian/glibc.
- Keep runtime images non-root.
- Use digest-pinned container bases.
- Do not adopt draft, incompatible, superseded, or untested upstream pull requests.

---

### Task 1: Update the Go toolchain floor and patch dependency graph

**Files:**
- Modify: `go.mod`
- Modify: `go.sum`

**Interfaces:**
- Consumes: the current module graph and compatibility pins in `.github/renovate.json`
- Produces: a tidy module graph requiring Go 1.26.5

- [ ] **Step 1: Confirm the existing module graph is tidy**

Run:

```shell
GOTOOLCHAIN=go1.26.4 go mod tidy -diff
```

Expected: no diff.

- [ ] **Step 2: Raise the minimum Go version and apply patch-only updates**

Run:

```shell
GOTOOLCHAIN=go1.26.5 go mod edit -go=1.26.5
GOTOOLCHAIN=go1.26.5 go get -u=patch ./...
GOTOOLCHAIN=go1.26.5 go mod tidy
```

Expected direct module versions:

```text
github.com/luthermonson/go-proxmox v0.5.1
github.com/sergelogvinov/go-proxmox v0.2.0
```

- [ ] **Step 3: Verify the updated module graph**

Run:

```shell
GOTOOLCHAIN=go1.26.5 go mod verify
GOTOOLCHAIN=go1.26.5 go test ./...
GOTOOLCHAIN=go1.26.5 make build
```

Expected: module verification, tests, and all three binary builds succeed.

### Task 2: Harden the controller runtime with DHI Static

**Files:**
- Modify: `Dockerfile`

**Interfaces:**
- Consumes: statically linked `proxmox-csi-controller-${TARGETARCH}` from the Alpine DHI builder
- Produces: a non-root controller image with CA certificates and no shell or package manager

- [ ] **Step 1: Remove the unused `develop` stage**

Delete the unreferenced stage:

```dockerfile
FROM dhi.io/golang:1.26.5-debian13-dev AS develop
WORKDIR /src
COPY ["go.mod", "go.sum", "/src/"]
RUN go mod download
```

- [ ] **Step 2: Replace the controller runtime base**

Use the verified DHI Static Alpine 3.24 image:

```dockerfile
FROM --platform=${TARGETARCH} dhi.io/static:20260611-alpine3.24@sha256:93568eb7c673afb3ad79b15cca341469d3e02cf859caae1049aa22fe7fbce90a AS proxmox-csi-controller
```

Copy the controller binary to `/bin/proxmox-csi-controller` and retain the existing OCI labels and entrypoint. Do not override the image's non-root UID 65532.

- [ ] **Step 3: Refresh the Alpine runtime digest**

Replace both `dhi.io/alpine-base:3.24` digests with:

```text
sha256:50fb687eb3253a7aec8ceb611d36976992f94b50e13f43d0087d59afc49e19f3
```

- [ ] **Step 4: Pass the target architecture into the cross-compiler**

Declare BuildKit's automatic target argument in the builder and pass it to the Makefile:

```dockerfile
ARG TARGETARCH
RUN make ARCHS=${TARGETARCH} build-all-archs
```

This ensures an arm64 runtime copies arm64 binaries instead of the Makefile's default amd64 outputs.

- [ ] **Step 5: Validate Dockerfile structure and build all runtime targets**

Run:

```shell
docker buildx build --check --platform=linux/amd64,linux/arm64 -f Dockerfile .
docker buildx build --platform=linux/arm64 --load --target proxmox-csi-controller -t proxmox-csi-controller:dependency-hardening .
docker buildx build --platform=linux/arm64 --load --target proxmox-csi-node -t proxmox-csi-node:dependency-hardening .
docker buildx build --platform=linux/arm64 --load --target pvecsictl -t pvecsictl:dependency-hardening .
```

Expected: Dockerfile check and all three arm64 image builds succeed.

### Task 3: Modernize least-privilege Proxmox documentation

**Files:**
- Modify: `docs/install.md`
- Modify: `charts/proxmox-csi-plugin/README.md.gotmpl`
- Regenerate: `charts/proxmox-csi-plugin/README.md`

**Interfaces:**
- Consumes: current BPG Terraform provider resources and Proxmox token privilege separation
- Produces: matching CLI, Terraform/OpenTofu, and generated Helm documentation

- [ ] **Step 1: Update CLI permission examples**

Add `VM.Replicate` to the replication role, create the token with `-privsep 1`, and assign the `CSI` role to both the user and token:

```shell
pveum user token add kubernetes-csi@pve csi -privsep 1
pveum aclmod / -user kubernetes-csi@pve -role CSI
pveum aclmod / -token 'kubernetes-csi@pve!csi' -role CSI
```

- [ ] **Step 2: Replace deprecated Terraform resources**

Use:

```hcl
resource "proxmox_virtual_environment_user" "kubernetes" {
  comment = "Kubernetes"
  user_id = "kubernetes-csi@pve"
}

resource "proxmox_user_token" "csi" {
  comment               = "Kubernetes CSI"
  privileges_separation = true
  token_name            = "csi"
  user_id               = proxmox_virtual_environment_user.kubernetes.user_id
}

resource "proxmox_acl" "csi_user" {
  user_id   = proxmox_virtual_environment_user.kubernetes.user_id
  role_id   = proxmox_virtual_environment_role.csi.role_id
  path      = "/"
  propagate = true
}

resource "proxmox_acl" "csi_token" {
  token_id  = proxmox_user_token.csi.id
  role_id   = proxmox_virtual_environment_role.csi.role_id
  path      = "/"
  propagate = true
}
```

- [ ] **Step 3: Regenerate and verify Helm README**

Run:

```shell
helm-docs --sort-values-order=file charts/proxmox-csi-plugin
rg -n "privsep 0|proxmox_virtual_environment_user_token|proxmox_virtual_environment_acl" docs/install.md charts/proxmox-csi-plugin
```

Expected: README regeneration succeeds and the deprecated/insecure patterns are absent.

### Task 4: Resolve the Staticcheck cleanup

**Files:**
- Modify: `pkg/csi/retry.go`
- Test: `pkg/csi/retry_test.go`

**Interfaces:**
- Consumes: `expectedRetryError`
- Produces: an equivalent `retryTimeoutError` via direct type conversion

- [ ] **Step 1: Establish the existing retry tests are green**

Run:

```shell
GOTOOLCHAIN=go1.26.5 go test ./pkg/csi -run TestRetryConstant -count=1
```

Expected: all retry tests pass.

- [ ] **Step 2: Apply the behavior-preserving refactor**

Replace:

```go
return retryTimeoutError{err: expected.err}
```

with:

```go
return retryTimeoutError(expected)
```

- [ ] **Step 3: Verify behavior and static analysis**

Run:

```shell
GOTOOLCHAIN=go1.26.5 go test ./pkg/csi -run TestRetryConstant -count=1
GOTOOLCHAIN=go1.26.5 go run honnef.co/go/tools/cmd/staticcheck@latest ./...
```

Expected: retry tests and Staticcheck succeed.

### Task 5: Final verification and upstream disposition

**Files:**
- Inspect: all modified files
- Inspect: upstream issues and pull requests

**Interfaces:**
- Consumes: Tasks 1-4
- Produces: a verified branch plus an evidence-based upstream triage report

- [ ] **Step 1: Run repository verification**

Run:

```shell
GOTOOLCHAIN=go1.26.5 go mod verify
GOTOOLCHAIN=go1.26.5 go test ./...
GOTOOLCHAIN=go1.26.5 go vet ./...
GOTOOLCHAIN=go1.26.5 make build
GOTOOLCHAIN=go1.26.5 go run golang.org/x/vuln/cmd/govulncheck@latest ./...
```

Expected: every command succeeds with no called vulnerabilities.

- [ ] **Step 2: Inspect the complete diff**

Run:

```shell
git diff --check
git diff --stat
git diff
```

Expected: only planned files changed, with no whitespace errors.

- [ ] **Step 3: Refresh upstream triage**

Run:

```shell
gh issue list --repo sergelogvinov/proxmox-csi-plugin --state open --limit 100
gh pr list --repo sergelogvinov/proxmox-csi-plugin --state open --limit 100
```

Expected: final report accounts for every currently open issue and pull request.
