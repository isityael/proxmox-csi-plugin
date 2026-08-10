#!/usr/bin/env bash
set -euo pipefail

pipeline="$(git rev-parse --show-toplevel)/.woodpecker/release.yaml"
test -f "${pipeline}"
grep -Fq 'branch: main' "${pipeline}"
grep -Fq 'target: proxmox-csi-controller' "${pipeline}"
grep -Fq 'target: proxmox-csi-node' "${pipeline}"
grep -Fq 'candidate-${CI_COMMIT_SHA}' "${pipeline}"
grep -Fq 'name: scan-candidates' "${pipeline}"
grep -Fq 'name: sign-candidates' "${pipeline}"
grep -Fq 'name: promote-release' "${pipeline}"
grep -Fq 'proxmox-csi-controller:edge' "${pipeline}"
grep -Fq 'proxmox-csi-node:edge' "${pipeline}"
printf 'Proxmox CSI release policy passed\n'
