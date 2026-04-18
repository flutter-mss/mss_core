# mss_core

The Memention Software Shop plugin contract. Five tiny interface files under
`lib/src/` — `AppInterface`, `ModuleInterface`, `ExtensionInterface`,
`ExtensionFactory`, `PluginBase`. Nothing else ships here.

Plugins subclass one of the interfaces; the MSS client combines them into
assembled macOS apps.

## Rules that aren't obvious from one file

- **Semver is load-bearing.** Any change to an interface is breaking for
  every plugin that subclasses it. Plugins pin via git `ref:`, so there's no
  "accidental" upgrade — only breakage when authors retarget. Cut a clean
  minor/major when interfaces change.
- **`setupExtensions` on `AppInterface` defaults to a no-op.** Apps that
  use extensions must override it; otherwise extensions silently don't
  reach the UI. Do not make it abstract — app plugins that don't use
  extensions would have to implement a pointless stub.
- **`PluginBase.assetPrefix` has a public setter.** The combiner writes it
  at construction so `asset('x.png')` resolves to
  `packages/<pkg>/assets/x.png` inside an assembled app. Plugins should
  never compute the prefix themselves.
- **Extensions go through a factory** (`ExtensionFactory<T>`) — the
  combiner calls `factory().createWithAssetPrefix(...)` so instances land
  with their prefix already set. If you add another extension-class
  lifecycle hook, thread it through the factory too.

## Dev loop

```bash
flutter analyze
flutter test
```

The plugin author guide lives in [`README.md`](README.md). Keep it in sync
when interfaces change — it's the canonical entry point for new plugin
authors.

## See also

- [mss_app](https://github.com/flutter-mss/mss_app) — client that hosts the combiner
- Reference plugins: [demo_photoapp](https://github.com/flutter-mss/demo_photoapp),
  [demo_flappybird](https://github.com/flutter-mss/demo_flappybird),
  [demo_alternative_physics](https://github.com/flutter-mss/demo_alternative_physics)
