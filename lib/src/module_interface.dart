import 'package:flutter/widgets.dart';

import 'plugin_base.dart';

abstract class ModuleInterface with PluginBase {
  /// Build the main UI for this module.
  Widget buildUI(BuildContext context);
}
