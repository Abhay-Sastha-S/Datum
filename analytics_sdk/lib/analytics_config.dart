import 'dart:convert';
import 'package:flutter/services.dart';

/// Loads analytics configuration from a file, allowing customization of tracking behavior.
class AnalyticsConfig {
  static final Map<String, dynamic> _config = {};

  static Future<void> loadConfig(String path) async {
    final jsonString = await rootBundle.loadString(path);
    _config.addAll(json.decode(jsonString));
  }

  static dynamic get(String key) => _config[key];
}
