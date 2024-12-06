```
bazel run -- @pnpm//:pnpm --dir $PWD install
```

```
bazel build //repro:bin
```

```
bazel run //repro:bin
```