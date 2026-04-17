import 'package:flutter/widgets.dart';

import 'extension_interface.dart';
import 'module_interface.dart';
import 'plugin_base.dart';

abstract class AppInterface with PluginBase {
  /// Set up the app with available modules.
  void setup(List<ModuleInterface> modules);

  /// Called after [setup] with the available extension instances, already
  /// configured with their asset prefix. Apps override this to wire up
  /// extensions they care about; the default is a no-op so apps that
  /// don't use extensions don't need to implement it.
  void setupExtensions(List<ExtensionInterface> extensions) {}

  /// Build the root widget for this app.
  Widget buildApp();
}
