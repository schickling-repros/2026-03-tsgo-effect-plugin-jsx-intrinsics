# Effect-TS/tsgo - JSX intrinsic elements break when the Effect plugin is enabled

`tsc` accepts this React TSX file, but `tsgo` reports missing JSX intrinsic elements when the `@effect/language-service` plugin is enabled.

## Reproduction

```bash
bun install
bun run repro
```

`repro.sh` runs:

1. `tsc --build tsconfig.json --pretty false`
2. `tsgo --build tsconfig.json --pretty false`

The script fetches `tsgo` via:

```bash
nix build github:Effect-TS/tsgo#tsgo --no-link --print-out-paths
```

## Expected

Both `tsc` and `tsgo` should accept the file.

## Actual

`tsc` passes, but `tsgo` reports:

```text
repro.tsx(1,28): error TS2304: Cannot find name 'div'.
repro.tsx(1,39): error TS2304: Cannot find name 'div'.
```

If the plugin entry is removed from `tsconfig.json`, `tsgo` passes too.

## Versions

- `@effect/language-service`: `0.79.0`
- `react`: `19.2.4`
- `@types/react`: `19.2.14`
- `typescript`: `5.9.3`
- `tsgo`: `Version 7.0.0-dev`
- Node: `v24.13.0`
- Bun: `1.3.9`
- OS: Linux

## Related Issue

TBD
