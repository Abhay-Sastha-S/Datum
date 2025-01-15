import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Buffer for storing events offline when network is unavailable.
class OfflineBuffer {
  static const String _key = "analytics_buffer";
  static List<Map<String, dynamic>> _buffer = [];

  static Future<void> addEvent(Map<String, dynamic> event) async {
    _buffer.add(event);
    await saveToDisk();
  }

  static Future<void> sendBufferedEvents() async {
    // Logic to attempt resending buffered events.
    // For example:
    // for (final event in _buffer) {
    //   try {
    //     AnalyticsService.trackEvent(event['name'], event['data']);
    //     _buffer.remove(event);
    //   } catch (e) {
    //     // Retry later
    //   }
    // }
  }

  static Future<void> saveToDisk() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(_buffer));
  }
}
