ifneq (1,$(IS_GOMK_GO_CYCLO_LOADED))

# note that the file is loaded
IS_GOMK_GO_CYCLO_LOADED := 1

ifeq (1,$(GO_CYCLO_ENABLED))

vpath %.go.cyclo $(GO_MARKERS_DIR)

GOCYCLO_BIN := $(GO_BIN)/gocyclo
$(GOCYCLO_BIN):
	go get -v -u github.com/fzipp/gocyclo

define GO_CYCLO
GO_CYCLO_MARKER_FILE_$1 := $$(call GO_TOOL_MARKER,$1,cyclo)
GO_CYCLO_MARKER_PATHS_$2 += $$(GO_CYCLO_MARKER_FILE_$1)

$1-cyclo: $$(GO_CYCLO_MARKER_FILE_$1)
$$(GO_CYCLO_MARKER_FILE_$1): $1 | $$(GOCYCLO_BIN)
	gocyclo -over 15 $$?
	@$$(call GO_TOUCH_MARKER,$$@)
endef

GO_DEPS += $(GOCYCLO_BIN)
GO_BUILD_DEPS += $(GOCYCLO_BIN)
GO_BUILD_DEP_RULES += GO_CYCLO
endif

endif
