# Repro 12/06/24

Demonstrate that pulsar.node is not transited 

Relevant files:
- `defs.bzl`
- `.swcrc`

# Install dependencies
```
bazel run -- @pnpm//:pnpm --dir $PWD install
```

# Build (passes)
```
bazel build //repro:bin
```

# Run (fails)
```
bazel run //repro:bin
```