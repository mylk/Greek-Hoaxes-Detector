GHD_AN_FX_VERSION := $(shell cat manifest.json | jq -r .version)

package:
	echo "Removing \"greek_hoaxes_detector-*-an+fx.xpi\"..."
	rm -f greek_hoaxes_detector-*-an+fx.xpi
	echo "Building version \"${GHD_AN_FX_VERSION}\"..."
	zip -Z deflate -1 --test -r greek_hoaxes_detector-${GHD_AN_FX_VERSION}-an+fx.xpi . -x@.xpiignore

dev:
	sudo npm install -g addons-linter

lint:
	addons-linter greek_hoaxes_detector-${GHD_AN_FX_VERSION}-an+fx.xpi