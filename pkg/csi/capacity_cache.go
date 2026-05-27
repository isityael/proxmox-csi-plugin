package csi

import (
	"sync"
	"time"
)

const storageCapacityTTL = time.Minute

type capacityCache struct {
	ttl     time.Duration
	now     func() time.Time
	mu      sync.Mutex
	entries map[string]capacityCacheEntry
}

type capacityCacheEntry struct {
	value     int64
	expiresAt time.Time
}

func newCapacityCache(ttl time.Duration) *capacityCache {
	return &capacityCache{
		ttl:     ttl,
		now:     time.Now,
		entries: make(map[string]capacityCacheEntry),
	}
}

func (c *capacityCache) Get(key string) (int64, bool) {
	c.mu.Lock()
	defer c.mu.Unlock()

	entry, ok := c.entries[key]
	if !ok {
		return 0, false
	}

	if !entry.expiresAt.After(c.now()) {
		delete(c.entries, key)

		return 0, false
	}

	return entry.value, true
}

func (c *capacityCache) Set(key string, value int64) {
	c.mu.Lock()
	defer c.mu.Unlock()

	c.entries[key] = capacityCacheEntry{
		value:     value,
		expiresAt: c.now().Add(c.ttl),
	}
}
