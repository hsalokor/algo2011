# What is this?

Simple JSON server in Haskell using Snap web server and Aeson JSON library. Whipped together as a framework for Reaktor code camp.

# Setting up

On Ubuntu:

    sudo apt-get install haskell-platform cabal-install

# Building

Use the makefile for single-command build. Makefile will use cabal (must be in path) to install necessary haskell libraries.

    make

Or, if you want to run the application manually:

    cabal install snap-server aeson
    cabal configure
    cabal build
    dist/algo/algo --listen=8888

# Testing

Push simple JSON document to server using

    ./test.sh

This causes the server to process the request and return non-sense response.

Have fun!
