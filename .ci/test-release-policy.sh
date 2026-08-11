#!/usr/bin/env bash
set -euo pipefail

pipeline="$(git rev-parse --show-toplevel)/.woodpecker/release.yaml"
tag_workflow="$(git rev-parse --show-toplevel)/.forgejo/workflows/release-tag.yaml"
test -f "${pipeline}"
test -f "${tag_workflow}"
grep -Fq 'event: tag' "${pipeline}"
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
printf 'Proxmox CSI release policy passed\n'
