# Build the site
build FLAGS='':
    soupault {{ FLAGS }}

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

# Clear the build outputs and cache
clean:
    rm -rf .soupault-cache build/
