# boostrap-feature-tests

[![Build Status](https://github.com/dohernandez/boostrap-feature-tests/workflows/test/badge.svg)](https://github.com/dohernandez/boostrap-feature-tests/actions?query=branch%3Amain+workflow%3Atest)
[![GoDevDoc](https://img.shields.io/badge/dev-doc-00ADD8?logo=go)](https://pkg.go.dev/github.com/dohernandez/boostrap-feature-tests)
![Code lines](https://sloc.xyz/github/dohernandez/boostrap-feature-tests/?category=code)
![Comments](https://sloc.xyz/github/dohernandez/boostrap-feature-tests/?category=comments)

This library helps to define a suite test for github.com/cucumber/godog.

## Usage

#### Feature

```gherkin
# features/test.feature
Feature: Test boostrap feature run.

  Scenario: Test boostrap feature run
    When I boostrap feature
    Then I should have run
```

#### Configuration

Register the context, set the folder with the feature files to run the suite.

```go
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
```