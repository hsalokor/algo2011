# What is this?

Simple JSON server in Haskell using Snap web server and Aeson JSON library. Whipped together as a framework for Reaktor code camp.

# Setting up

On Ubuntu:

sudo apt-get install haskell-platform cabal-install

# Building

Use the makefile for single-command build. Makefile will use cabal (must be in path) to install necessary haskell libraries.

  make

Or, if you want to run the application manually:

  cabal configure
  cabal build

