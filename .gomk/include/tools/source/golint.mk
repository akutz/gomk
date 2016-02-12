ifneq (1,$(IS_GOMK_GO_LINT_LOADED))

# note that the file is loaded
IS_GOMK_GO_LINT_LOADED := 1

ifeq (1,$(GO_LINT_ENABLED))

vpath %.go.lint $(GO_MARKERS_DIR)

GOFGT_BIN := $(GO_BIN)/fgt
$(GOFGT_BIN):
	go get -v -u github.com/GeertJohan/fgt

GO_BUILD_DEPS := $(GOFGT_BIN) $(GO_BUILD_DEPS)

GOLINT_BIN := $(GO_BIN)/golint
$(GOLINT_BIN): | $(GOFGT_BIN)
	go get -v -u github.com/golang/lint/golint

define GO_LINT
GO_LINT_MARKER_FILE_$1 := $$(call GO_TOOL_MARKER,$1,lint)
GO_LINT_MARKER_PATHS_$2 += $$(GO_LINT_MARKER_FILE_$1)

$1-lint: $$(GO_LINT_MARKER_FILE_$1)
$$(GO_LINT_MARKER_FILE_$1): $1 | $$(GOLINT_BIN)
	fgt golint $$?
	@$$(call GO_TOUCH_MARKER,$$@)
endef

GO_DEPS += $(GOLINT_BIN)
GO_BUILD_DEPS += $(GOLINT_BIN)
GO_BUILD_DEP_RULES += GO_LINT
endif

endif
