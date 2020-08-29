ALL_PACKAGES := \
	essentials-base \
	essentials-javascript \
	essentials-python \
	essentials-react \
	essentials-vuejs
DIST_FILES := $(wildcard dist/*.vsix)

.PHONY: setup clean build-% build-all install-% install-all uninstall-% uninstall-all

setup:
	npm i

clean:
	rm -rf dist/

build-%:
	./scripts/package.sh $(*)

build-all: $(addprefix build-, $(ALL_PACKAGES))

install-%:
	code --install-extension dist/$(*)-*.vsix

install-all: $(addprefix install-, $(ALL_PACKAGES))

uninstall-%:
	code --uninstall-extension dist/$(*)-*.vsix

uninstall-all: $(addprefix uninstall-, $(ALL_PACKAGES))
