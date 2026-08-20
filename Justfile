# Run `just` with no arguments to see this list.
default:
    @just --list

# Build the gallery from the catalog into site/public.
build:
    cp index.json site/static/index.json
    cd site && nice -n 19 zola build

# Serve the gallery locally with live reload.
serve: 
    cp index.json site/static/index.json
    cd site && zola serve

# Every check a push must pass: valid index, building site, valid workflows.
ci:
    jq empty index.json
    just build
    actionlint -shellcheck '' .github/workflows/*.yml
