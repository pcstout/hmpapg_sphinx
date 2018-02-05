# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = HMPAPG
SOURCEDIR     = source
BUILDDIR      = /tmp/sphinx_build
DOCS          = docs

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	rm -rf $(DOCS)/*
	cp -R $(BUILDDIR)/html/* $(DOCS)
	rm -rf $(DOCS)/_sources

# Watch the $(SOURCEDIR) for changes and run `make html`.
watch:
	while true; do inotifywait -r -e "create,modify,move,delete" --exclude .git $(SOURCEDIR); make html; done