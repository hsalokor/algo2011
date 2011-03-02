CABAL=cabal
GHC_GET_PKG=ghc-pkg list --simple-output
GET_VER=cut -d- -f2

AESON_VERSION = $(shell $(GHC_GET_PKG) aeson | $(GET_VER))
SNAP_VERSION = $(shell $(GHC_GET_PKG) snap | $(GET_VER))

all: run

install-snap:
ifndef SNAP_VERSION
	$(CABAL) install snap
endif

install-aeson:
ifndef AESON_VERSION
		$(CABAL) install aeson
endif

install-deps: install-snap install-aeson

print-versions:
	@echo Aeson version: $(AESON_VERSION)
	@echo Snap version: $(SNAP_VERSION)

configure: install-deps print-versions
	$(CABAL) configure

build: configure
	$(CABAL) build

run: build
	dist/build/algo/algo --port=8888
