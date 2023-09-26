#!/bin/sh

REPOS="https://github.com/tree-sitter/tree-sitter-c
https://github.com/tree-sitter/tree-sitter-cpp
https://github.com/CyberShadow/tree-sitter-d
https://github.com/the-mikedavis/tree-sitter-diff
https://github.com/tree-sitter/tree-sitter-go
https://github.com/camdencheek/tree-sitter-go-mod
https://github.com/tree-sitter/tree-sitter-javascript
https://github.com/tree-sitter/tree-sitter-julia
https://github.com/MunifTanjim/tree-sitter-lua
https://github.com/tree-sitter/tree-sitter-rust
https://github.com/maxxnino/tree-sitter-zig"

clone_and_generate() {
    printf '%s' "$REPOS" | xargs -d"\n" -n 1 -P 4 -t git clone --depth 1 --no-tags
    for repo in $REPOS; do
        set -- "$@" "${repo##*/}"
    done
   ./fake-gyp.py "$@"
}

clone_and_generate
