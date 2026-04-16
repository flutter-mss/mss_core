import 'plugin_base.dart';

class ExtensionFactory<T extends PluginBase> {
  final String name;
  final T Function() create;

  const ExtensionFactory({required this.name, required this.create});

  T createWithAssetPrefix(String prefix) {
    final instance = create();
    instance.assetPrefix = prefix;
    return instance;
  }
}
