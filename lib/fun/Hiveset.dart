import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsProvider extends ChangeNotifier {
  final Box box = Hive.box('settingsBox');

  Map<String, dynamic> _settings = {
    "province": "กรุงเทพมหานคร",
    // "fastingHours": 16,
    // "eatingHours": 8,
    // "theme": "light",
  };

  String get province => _settings["province"];
  // int get fastingHours => _settings["fastingHours"];
  // int get eatingHours => _settings["eatingHours"];
  // String get theme => _settings["theme"];

  void loadSettings() {
    final saved = box.get('settings');
    if (saved != null) {
      _settings = Map<String, dynamic>.from(saved);
    }
    notifyListeners();
  }

  void updateSetting(String key, dynamic value) {
    _settings[key] = value;
    box.put('settings', _settings);
    notifyListeners();
  }
}