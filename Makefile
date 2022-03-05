GO ?= go
export GO111MODULE = on

PWD = $(shell pwd)

# Detecting GOPATH and removing trailing "/" if any
GOPATH = $(realpath $(shell $(GO) env GOPATH))

ifneq "$(GOFLAGS)" ""
  $(info GOFLAGS: ${GOFLAGS})
endif

PROJECT_PATH = $(PWD)
DEVGO_PATH = $(PROJECT_PATH)/dev
DEVGO_SCRIPTS = $(DEVGO_PATH)/scripts
DEVGO_MAKEFILES = $(DEVGO_PATH)/makefiles

-include $(DEVGO_MAKEFILES)/help.mk
-include $(DEVGO_MAKEFILES)/lint.mk
-include $(DEVGO_MAKEFILES)/test-unit.mk

## Run tests
test: test-unit
