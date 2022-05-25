# add new workflows to `GHA_WORKFLOWS_FILES` as needed
.PHONY: all setup build_index build_rmd preview

# GHA Workflows
GH_DIR = .github
GHA_WORKFLOWS_DIR = $(addprefix $(GH_DIR)/,workflows)
GHA_WORKFLOWS_FILES = site.yaml
GHA_WORKFLOW_FILE_PATHS = $(addprefix $(GHA_WORKFLOWS_DIR)/,$(GHA_WORKFLOWS_FILES))

# GitHub Pages
GHPAGES_DIR = docs
GHPAGES_FILES = .nojekyll
GHPAGES_FILE_PATHS = $(addprefix $(GHPAGES_DIR)/,$(GHPAGES_FILES))

# RMD html_document output
RMD_DIRS = libs
RMD_GHPAGES_DIRS = $(addprefix $(GHPAGES_DIR)/,$(RMD_DIRS))

# Site Static Content
SITE_DIR = static
SITE_FILES = index.html
SITE_FILE_PATHS = $(addprefix $(SITE_DIR)/,$(SITE_FILES))

.PHONY: all build preview

all: setup build_rmd

setup: | $(GHA_WORKFLOW_FILE_PATHS) $(GHPAGES_FILE_PATHS) 
	
build_rmd: 
	Rscript utils/build_spatial_mlr3.R

$(GHPAGES_FILE_PATHS): | $(RMD_GHPAGES_DIRS)
	touch $@
	echo 'setup GitHub Pages'

$(RMD_GHPAGES_DIRS):
	mkdir -p $@
	echo 'setup RMD'
	
$(GHA_WORKFLOW_FILE_PATHS): | $(GHA_WORKFLOWS_DIR)
	touch $@
	echo 'setup GHA'
	
$(GHA_WORKFLOWS_DIR):
	mkdir -p $@
	
preview:
	Rscript utils/preview.R
