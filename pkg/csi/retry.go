package csi

import (
	"errors"
	"time"
)

type expectedRetryError struct {
	err error
}

func (e expectedRetryError) Error() string {
	return e.err.Error()
}

func (e expectedRetryError) Unwrap() error {
	return e.err
}

type retryTimeoutError struct {
	err error
}

func (e retryTimeoutError) Error() string {
	return e.err.Error()
}

func (e retryTimeoutError) Unwrap() error {
	return e.err
}

func retryExpectedError(err error) error {
	return expectedRetryError{err: err}
}

func isRetryTimeout(err error) bool {
	var timeout retryTimeoutError

	return errors.As(err, &timeout)
}

func retryConstant(timeout, interval time.Duration, operation func() error) error {
	deadline := time.Now().Add(timeout)

	for {
		err := operation()
		if err == nil {
			return nil
		}

		var expected expectedRetryError
		if !errors.As(err, &expected) {
			return err
		}

		if !time.Now().Before(deadline) {
			return retryTimeoutError{err: expected.err}
		}

		time.Sleep(interval)
	}
}
