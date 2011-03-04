CABAL=cabal
GHC_GET_PKG=ghc-pkg list --simple-output
GET_VER=cut -d- -f2

AESON_VERSION = $(shell $(GHC_GET_PKG) aeson | $(GET_VER))
SNAP_VERSION = $(shell $(GHC_GET_PKG) snap | $(GET_VER))

all: production

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

configure-development: install-deps print-versions
	$(CABAL) configure

configure-optimized: install-deps print-versions
	$(CABAL) configure -f "-development"

build:
	$(CABAL) build

production: configure-optimized build
	dist/build/algo/algo --port=8888 +RTS -N2

development: configure-development build
	dist/build/algo/algo --port=8000 +RTS -N2
