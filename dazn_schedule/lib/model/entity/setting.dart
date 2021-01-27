import 'package:dazn_schedule/view_model/settings_vm.dart';

class Setting {

  Setting(this.settingsKind, this.name, this.key, this.defaultValue);

  final SettingsKind settingsKind;
  final String name;
  final String key;
  final dynamic defaultValue;

  String value;
}
