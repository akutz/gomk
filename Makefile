all: install

include .gomk/go.mk

deps: $(GO_DEPS)

build: $(GO_BUILD)

install: $(GO_INSTALL)

test: $(GO_TEST)

test-build: $(GO_TEST_BUILD)

test-clean: $(GO_TEST_CLEAN)

cover: $(GO_COVER)

cover-clean: $(GO_COVER_CLEAN)

clean: $(GO_CLEAN)

clobber: $(GO_CLOBBER)

.PHONY: all install build deps \
		test test-build test-clean \
		cover cover-clean \
		clean clobber \
		$(GO_PHONY)
