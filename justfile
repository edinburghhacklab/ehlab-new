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

new-post TITLE:
    #!/usr/bin/env bash
    set -euxo pipefail
    DIR="site/$(date '+%Y/%m')"
    SLUG="$(echo "{{ TITLE }}" | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)"
    FILE="$DIR/$SLUG.md"
    mkdir -p "$DIR"
    cp templates/new-post.md "$FILE"
    sed -i "s/1999-01-01/$(date '+%Y-%m-%d')/" "$FILE"
    sed -i "s/NEW POST TEMPLATE/{{ TITLE }}/" "$FILE"
    echo "Now edit your new post at $FILE"
