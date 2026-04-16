import 'package:flutter/widgets.dart';

import 'plugin_base.dart';
import 'module_interface.dart';

abstract class AppInterface with PluginBase {
  /// Set up the app with available modules.
  void setup(List<ModuleInterface> modules);

  /// Build the root widget for this app.
  Widget buildApp();
}
