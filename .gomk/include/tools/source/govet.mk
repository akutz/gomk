ifneq (1,$(IS_GOMK_GO_VET_LOADED))

# note that the file is loaded
IS_GOMK_GO_VET_LOADED := 1

ifeq (1,$(GO_VET_ENABLED))

vpath %.go.vet $(GO_MARKERS_DIR)

define GO_VET
GO_VET_MARKER_FILE_$1 := $$(call GO_TOOL_MARKER,$1,vet)
GO_VET_MARKER_PATHS_$2 += $$(GO_VET_MARKER_FILE_$1)

$1-vet: $$(GO_VET_MARKER_FILE_$1)
$$(GO_VET_MARKER_FILE_$1): $1
	$(ENV) GOOS=$(SYS_GOOS) GOARCH=$(SYS_GOARCH) go vet $$?
	@$$(call GO_TOUCH_MARKER,$$@)
endef

GO_BUILD_DEP_RULES += GO_VET
endif

endif
