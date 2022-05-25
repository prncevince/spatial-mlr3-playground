.PHONY: all build preview

all: build

build: | docs/libs docs/.nojekyll
	Rscript utils/build_spatial_mlr3.R

docs/libs:
	mkdir -p docs/libs
	
docs/.nojekyll:
	touch docs/.nojekyll
	
preview:
	Rscript utils/preview.R
