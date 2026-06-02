#!/usr/bin/env bash
set -e
docker run -it --rm -p 8000:8000 -v soupault-build:/src/build -v soupault-cache:/src/.soupault-cache -v $(pwd):/src -w /src ghcr.io/edinburghhacklab/ehlab-new:main bash
