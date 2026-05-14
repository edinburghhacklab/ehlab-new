# Build the site
build FLAGS='':
    soupault {{ FLAGS }}

# Build with nix
build-nix:
    nix-build -E "(import <nixpkgs> {}).callPackage ./default.nix {}"

deploy:
    #!/bin/sh
    OUT_PATH=$(nix-build -E "(import <nixpkgs> {}).callPackage ./default.nix {}")
    rsync -rlpvP --checksum --del $OUT_PATH/ root@doggirl.love:/var/www/gic.aria.rip/

# Watch for changes and rebuild
watch:
    #!/usr/bin/env bash
    set -e
    watchexec -w site -w templates -w soupault.toml -w plugins just build

# Serve the build directory on port 8000
serve:
    python3 -m http.server -d build 8000

# Watch and serve simultaneously
dev:
    just watch & just serve

clean:
    rm -rf .soupault-cache build/
