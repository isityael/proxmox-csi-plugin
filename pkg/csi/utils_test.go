/*
Copyright 2023 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package csi

import (
	"fmt"
	"testing"

	proxmox "github.com/luthermonson/go-proxmox"
	"github.com/stretchr/testify/assert"

	"github.com/sergelogvinov/proxmox-csi-plugin/pkg/utils/volume"
)

func TestIsVolumeAttached(t *testing.T) {
	t.Parallel()

	tests := []struct {
		msg           string
		vmConfig      *proxmox.VirtualMachineConfig
		pvc           string
		expectedLun   int
		expectedExist bool
	}{
		{
			msg:           "Empty VM config",
			vmConfig:      &proxmox.VirtualMachineConfig{},
			pvc:           "",
			expectedLun:   0,
			expectedExist: false,
		},
		{
			msg: "Empty PVC",
			vmConfig: &proxmox.VirtualMachineConfig{
				IDEs: map[string]string{
					"ide2": "local:iso/ubuntu-20.04.1-live-server-amd64.iso,media=cdrom",
				},
				SCSIs: map[string]string{
					"scsi0": "local-lvm:vm-100-disk-0,size=8G",
					"scsi5": "local-lvm:vm-100-pvc-123,size=8G",
				},
			},
			pvc:           "",
			expectedLun:   0,
			expectedExist: false,
		},
		{
			msg: "LUN 5",
			vmConfig: &proxmox.VirtualMachineConfig{
				IDEs: map[string]string{
					"ide2": "local:iso/ubuntu-20.04.1-live-server-amd64.iso,media=cdrom",
				},
				SCSIs: map[string]string{
					"scsi0": "local-lvm:vm-100-disk-0,size=8G",
					"scsi5": "local-lvm:vm-100-pvc-123,size=8G",
				},
			},
			pvc:           "pvc-123",
			expectedLun:   5,
			expectedExist: true,
		},
	}

	for _, testCase := range tests {
		t.Run(fmt.Sprint(testCase.msg), func(t *testing.T) {
			t.Parallel()

			lun, exist := isVolumeAttached(testCase.vmConfig, testCase.pvc)

			if testCase.expectedExist {
				assert.True(t, exist)
				assert.Equal(t, testCase.expectedLun, lun)
			} else {
				assert.False(t, exist)
				assert.Equal(t, 0, lun)
			}
		})
	}
}

func TestVolumeWWNIsStableForDisk(t *testing.T) {
	t.Parallel()

	first := volume.NewVolume("region", "node-a", "data", "vm-9999-pvc-123")
	second := volume.NewVolume("region", "node-b", "data", "vm-9999-pvc-123")

	assert.Equal(t, volumeWWN(first), volumeWWN(second))
	assert.Regexp(t, `^[0-9a-f]{16}$`, volumeWWN(first))
	assert.NotEqual(t, volumeWWN(first), volumeWWN(volume.NewVolume("region", "node-a", "data", "vm-9999-pvc-456")))
}

func TestAttachedVolumeReturnsConfiguredWWN(t *testing.T) {
	t.Parallel()

	config := &proxmox.VirtualMachineConfig{
		SCSIs: map[string]string{
			"scsi5": "local-lvm:vm-9999-pvc-123,size=8G,wwn=0x3123456789abcdef",
		},
	}

	lun, wwn, attached := attachedVolume(config, "vm-9999-pvc-123")

	assert.True(t, attached)
	assert.Equal(t, 5, lun)
	assert.Equal(t, "3123456789abcdef", wwn)
}
