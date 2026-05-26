//go:build !linux

package csi

import (
	"context"
	"errors"

	"github.com/siderolabs/go-blockdevice/v2/encryption"
)

var errEncryptedVolumeUnsupported = errors.New("encrypted volume operations require linux")

func encryptDevice(_ context.Context, _ string, _ *encryption.Key) error {
	return errEncryptedVolumeUnsupported
}

func resizeEncryptedDevice(_ context.Context, _ string, _ *encryption.Key) error {
	return errEncryptedVolumeUnsupported
}

func openEncryptedDevice(_ context.Context, _, _ string, _ *encryption.Key) (string, error) {
	return "", errEncryptedVolumeUnsupported
}

func closeEncryptedDevice(_ context.Context, _ string) error {
	return errEncryptedVolumeUnsupported
}
