/// Interface for data collectors, allowing for multiple analytics backends.
abstract class DataCollector {
  void logEvent(String eventName, Map<String, dynamic> eventData);
}

/// Example implementation for a hypothetical analytics backend.
class FirebaseCollector implements DataCollector {
  @override
  void logEvent(String eventName, Map<String, dynamic> eventData) {
    // Integrate with Firebase Analytics here
    // Example: FirebaseAnalytics.instance.logEvent(name: eventName, parameters: eventData);
    print("Firebase Event: $eventName, Data: $eventData");
  }
}
