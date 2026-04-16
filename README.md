# mss_core

Base interfaces for the [Memention Software Shop](https://mss.memention.net) plugin system.

Flutter plugins (apps, modules, extensions) implement types from this package so they can be assembled into a running app by the MSS desktop client.

## Install

```yaml
dependencies:
  mss_core:
    git:
      url: https://github.com/flutter-mss/mss_core.git
      ref: v0.1.0
```

## Interfaces

- `AppInterface` — top-level shell (one per built app)
- `ModuleInterface` — a feature block (usually one per app)
- `ExtensionInterface` — swappable add-on (zero or more per module)
- `ExtensionFactory<T>` — factory for instantiating extensions
- `PluginBase` — shared base mixin

## License

MIT. See [LICENSE](LICENSE).
