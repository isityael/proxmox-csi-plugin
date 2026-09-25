#!/usr/bin/env bash
set -euo pipefail

pipeline="$(git rev-parse --show-toplevel)/.woodpecker/release.yaml"
tag_workflow="$(git rev-parse --show-toplevel)/.forgejo/workflows/release-tag.yaml"
test -f "${pipeline}"
test -f "${tag_workflow}"
grep -Fq 'event: tag' "${pipeline}"
# Workflow-level depends_on only; step-level depends_on (DAG) is fine.
if grep -Eq '^depends_on:' "${pipeline}"; then
  echo 'tag release must not depend on a push-only workflow' >&2
  exit 1
fi
grep -Fq 'ci/woodpecker/push/ci' "${tag_workflow}"
grep -Fq 'target: proxmox-csi-controller' "${pipeline}"
grep -Fq 'target: proxmox-csi-node' "${pipeline}"
grep -Fq 'candidate-${CI_COMMIT_SHA}' "${pipeline}"
grep -Fq 'name: scan-candidates' "${pipeline}"
grep -Fq 'name: sign-candidates' "${pipeline}"
grep -Fq 'name: promote-release' "${pipeline}"
grep -Fq 'proxmox-csi-controller:edge' "${pipeline}"
grep -Fq 'proxmox-csi-node:edge' "${pipeline}"
grep -Fq 'proxmox-csi-controller:${CI_COMMIT_TAG}' "${pipeline}"
grep -Fq 'proxmox-csi-node:${CI_COMMIT_TAG}' "${pipeline}"
# Fork releases are v<upstream>-yael.<n>; the old -ym series is retired.
grep -Fq 'ref: refs/tags/v*-yael.*' "${pipeline}"
grep -Fq 'series="v${version}-yael"' "${tag_workflow}"
if grep -Eq -- '-ym([."]|$)' "${pipeline}" "${tag_workflow}"; then
  echo 'release naming must use -yael, not -ym' >&2
  exit 1
fi
printf 'Proxmox CSI release policy passed\n'
