ifneq (1,$(IS_GOMK_GO_FMT_LOADED))

# note that the file is loaded
IS_GOMK_GO_FMT_LOADED := 1

ifeq (1,$(GO_FMT_ENABLED))

vpath %.go.fmt $(GO_MARKERS_DIR)

define GO_FMT
GO_FMT_MARKER_FILE_$1 := $$(call GO_TOOL_MARKER,$1,fmt)
GO_FMT_MARKER_PATHS_$2 += $$(GO_FMT_MARKER_FILE_$1)

$1-fmt: $$(GO_FMT_MARKER_FILE_$1)
$$(GO_FMT_MARKER_FILE_$1): $1
	gofmt -w $$?
	@$$(call GO_TOUCH_MARKER,$$@)
endef

GO_BUILD_DEP_RULES += GO_FMT
endif

endif
