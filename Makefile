ALL_PACKAGES := base javascript vuejs
DIST_FILES := $(wildcard dist/*.vsix)

.PHONY: install

setup:
	npm i

clean:
	rm -rf dist/

build-%:
	./scripts/package.sh mh-packs-$(*)

build-all: $(addprefix build-, $(ALL_PACKAGES))

install-%:
	code --install-extension dist/$(*)-*.vsix

install-all: $(addprefix install-, $(ALL_PACKAGES))

