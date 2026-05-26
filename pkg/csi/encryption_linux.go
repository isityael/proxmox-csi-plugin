package csi

import (
	"context"

	"github.com/siderolabs/go-blockdevice/v2/encryption"
	luks "github.com/siderolabs/go-blockdevice/v2/encryption/luks"
)

func encryptDevice(ctx context.Context, devicePath string, key *encryption.Key) error {
	l := luks.New(luks.AESXTSPlain64Cipher)

	return l.Encrypt(ctx, devicePath, key)
}

func resizeEncryptedDevice(ctx context.Context, deviceName string, key *encryption.Key) error {
	l := luks.New(luks.AESXTSPlain64Cipher)

	return l.Resize(ctx, deviceName, key)
}

func openEncryptedDevice(ctx context.Context, devicePath, mappedName string, key *encryption.Key) (string, error) {
	l := luks.New(luks.AESXTSPlain64Cipher)

	return l.Open(ctx, devicePath, mappedName, key)
}

func closeEncryptedDevice(ctx context.Context, mappedName string) error {
	l := luks.New(luks.AESXTSPlain64Cipher)

	return l.Close(ctx, mappedName)
}
