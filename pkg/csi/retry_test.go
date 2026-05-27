package csi

import (
	"errors"
	"testing"
	"time"
)

func TestRetryConstantRetriesExpectedErrorsUntilSuccess(t *testing.T) {
	attempts := 0

	err := retryConstant(100*time.Millisecond, time.Nanosecond, func() error {
		attempts++
		if attempts < 3 {
			return retryExpectedError(errors.New("not ready"))
		}

		return nil
	})
	if err != nil {
		t.Fatalf("retryConstant returned error: %v", err)
	}

	if attempts != 3 {
		t.Fatalf("attempts = %d, want 3", attempts)
	}
}

func TestRetryConstantReturnsUnexpectedErrorsImmediately(t *testing.T) {
	want := errors.New("boom")
	attempts := 0

	err := retryConstant(time.Second, time.Millisecond, func() error {
		attempts++

		return want
	})
	if !errors.Is(err, want) {
		t.Fatalf("retryConstant error = %v, want %v", err, want)
	}

	if attempts != 1 {
		t.Fatalf("attempts = %d, want 1", attempts)
	}
}

func TestRetryConstantMarksTimeouts(t *testing.T) {
	err := retryConstant(time.Nanosecond, time.Nanosecond, func() error {
		return retryExpectedError(errors.New("not ready"))
	})

	if !isRetryTimeout(err) {
		t.Fatalf("isRetryTimeout(%v) = false, want true", err)
	}
}
