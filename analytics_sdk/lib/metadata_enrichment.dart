import 'dart:io';

/// Adds additional metadata to events, such as timestamps, device info, etc.
class MetadataEnrichment {
  static Map<String, dynamic> enrichEvent(Map<String, dynamic> event) {
    return {
      ...event,
      "timestamp": DateTime.now().toIso8601String(),
      "device": {
        "os": Platform.operatingSystem,
        "version": Platform.version,
      },
      "app": {
        "version": "1.0.0",
        "environment": "production",
      }
    };
  }
}
