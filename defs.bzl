load("@aspect_rules_js//js:defs.bzl", "js_binary")
load("@aspect_rules_swc//swc:defs.bzl", "swc")
load("@aspect_rules_ts//ts:defs.bzl", "ts_config", _ts_project = "ts_project")
load("@bazel_skylib//lib:partial.bzl", "partial")

def app(name):
    ts_config(
        name = "build_tsconfig",
        src = "tsconfig.build.json",
        deps = ["//:build_tsconfig"],
    )

    _ts_project(
        name = "ts",
        srcs = native.glob(["src/**/*.ts"]),
        transpiler = partial.make(swc, swcrc = ".swcrc", source_maps = True),
        declaration = True,
        declaration_map = True,
        composite = True,
        incremental = True,
        source_map = True,
        supports_workers = 0,
        tsconfig = ":build_tsconfig",
        extends = "//:build_tsconfig",
        deps = [
            "//:node_modules/pulsar-client",
        ],
    )

    js_binary(
        name = "bin",
        chdir = native.package_name(),
        data = [":ts"],
        entry_point = "src/main.js",
    )
