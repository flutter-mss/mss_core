mixin PluginBase {
  String _assetPrefix = '';

  String get assetPrefix => _assetPrefix;
  set assetPrefix(String value) => _assetPrefix = value;

  String asset(String name) => '$_assetPrefix$name';
}
