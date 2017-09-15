REMOTEUSER ?= yurovsky
REMOTEHOST ?= webspace.uchicago.edu
REMOTEDIR ?= /public_html/courses/autumn2017/psc201
REMOTE ?= $(REMOTEUSER)@$(REMOTEHOST):$(REMOTEDIR)

.PHONY: clean
clean:
	rm -rf _site/*

push: build
	rsync -az _site/* $(REMOTE)

build:
	jekyll build 

serve:
	bundle exec jekyll serve --watch