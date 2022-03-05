package feature_test

import (
	"sync/atomic"
	"testing"

	"github.com/cucumber/godog"
	feature "github.com/dohernandez/boostrap-feature-tests"
	"github.com/stretchr/testify/assert"
)

func TestRunFeatures(t *testing.T) {
	cnt := int64(0)

	feature.RunFeatures(t, "features", func(_ *testing.T, s *godog.ScenarioContext) {
		s.Step(`^I boostrap feature$`, func() error {
			atomic.AddInt64(&cnt, 1)

			return nil
		})

		s.Step(`^I should have run$`, func() error {
			assert.Equal(t, int64(1), atomic.LoadInt64(&cnt))

			return nil
		})
	})
}
