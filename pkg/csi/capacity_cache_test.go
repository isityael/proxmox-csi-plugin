package csi

import (
	"testing"
	"time"
)

func TestCapacityCacheReturnsStoredValueBeforeTTL(t *testing.T) {
	clock := time.Date(2026, 5, 27, 12, 0, 0, 0, time.UTC)
	cache := newCapacityCache(time.Minute)
	cache.now = func() time.Time { return clock }

	cache.Set("region/node/storage", 42)

	got, ok := cache.Get("region/node/storage")
	if !ok {
		t.Fatal("expected cached value")
	}

	if got != 42 {
		t.Fatalf("capacity = %d, want 42", got)
	}
}

func TestCapacityCacheExpiresStoredValueAfterTTL(t *testing.T) {
	clock := time.Date(2026, 5, 27, 12, 0, 0, 0, time.UTC)
	cache := newCapacityCache(time.Minute)
	cache.now = func() time.Time { return clock }

	cache.Set("region/node/storage", 42)
	clock = clock.Add(time.Minute)

	if got, ok := cache.Get("region/node/storage"); ok {
		t.Fatalf("capacity = %d, want expired cache miss", got)
	}
}
