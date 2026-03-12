#!/usr/bin/env bash
set -euo pipefail

echo '== tsc =='
./node_modules/.bin/tsc --build tsconfig.json --pretty false

echo
echo '== tsgo =='
TSGO_OUT="$(nix build github:Effect-TS/tsgo#tsgo --no-link --print-out-paths)"
"$TSGO_OUT/bin/tsgo" --build tsconfig.json --pretty false
