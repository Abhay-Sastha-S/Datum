# DATUM : One Line App Analytics

### A Dynamic, Developer-Friendly Analytics Solution

This **Analytics SDK** is a robust, dynamic, and highly customizable analytics package designed to simplify event tracking in Flutter applications. With zero boilerplate setup and automatic interaction mapping, it empowers developers to focus on building features while seamlessly collecting user behavior data. Built with modern software principles and extensibility in mind, this SDK is the perfect solution for data-driven applications.

---

## Features

### 1. **Plug-and-Play Integration**
Just wrap your app in `AnalyticsRoot`, and all interactions (taps, gestures, text input, etc.) are automatically tracked.
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAnalytics("assets/analytics_config.json");
  runApp(AnalyticsRoot(child: MyApp()));
}
```

### 2. **Automatic Event Tracking**
No need to wrap individual widgets or manually call tracking functions. The SDK intercepts user interactions dynamically and maps them to relevant events.

Examples of tracked interactions:
- **Button Taps**
- **Text Input**
- **Switch Toggles**
- **Checkbox Changes**
- **Gesture Detection (e.g., Swipes)**

### 3. **Dynamic Configuration**
Control the behavior of the SDK through a simple JSON configuration file. Define excluded widgets, enable/disable gesture tracking, and add global properties.
```json
{
  "excludeWidgets": ["TextField"],
  "trackGestures": true,
  "additionalProperties": {
    "appVersion": "1.0.0",
    "environment": "production"
  }
}
```

### 4. **Extensible Collector Architecture**
Easily integrate with multiple analytics platforms (e.g., Firebase, Mixpanel, or custom solutions) by implementing the `DataCollector` interface.
```dart
class FirebaseCollector implements DataCollector {
  @override
  void logEvent(String eventName, Map<String, dynamic> eventData) {
    FirebaseAnalytics.instance.logEvent(name: eventName, parameters: eventData);
  }
}
```

### 5. **Offline Buffering**
Automatically buffers events when offline and retries sending them when network connectivity is restored.

---

## Installation

### Prerequisites
Ensure you have the following set up in your Flutter project:
- Flutter SDK (>=2.5.0)
- `shared_preferences` dependency for offline buffering

### 1. **Add the SDK to Your Project**
Copy the `analytics_sdk` folder into your project’s `lib/` directory:
```
analytics_test_app/
└── lib/
    └── analytics_sdk/
        ├── analytics.dart
        ├── analytics_config.dart
        ├── analytics_service.dart
        ├── data_collector.dart
        ├── gesture_interceptor.dart
        ├── metadata_enrichment.dart
        └── offline_buffer.dart
```

### 2. **Add the Configuration File**
Create an `assets/` folder in your project’s root directory and add a file named `analytics_config.json`:
```json
{
  "excludeWidgets": ["TextField"],
  "trackGestures": true,
  "additionalProperties": {
    "appVersion": "1.0.0",
    "environment": "production"
  }
}
```

Register the configuration file in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/analytics_config.json
```

### 3. **Update Your `main.dart`**
Initialize the analytics SDK and wrap your app with `AnalyticsRoot`:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAnalytics("assets/analytics_config.json");
  runApp(AnalyticsRoot(child: MyApp()));
}
```

### 4. **Install Dependencies**
Add the following dependency in your `pubspec.yaml`:
```yaml
dependencies:
  shared_preferences: ^2.0.17
```
Run `flutter pub get` to install.

---

## Usage

### Automatic Event Tracking
By default, the SDK tracks common interactions such as:
- **Button Taps**
- **Text Input**
- **Switch and Checkbox Changes**
- **Gestures (e.g., swipes)**

All tracked events are automatically enriched with metadata, including:
- **Timestamps**
- **Device Information (OS, version)**
- **App Context (version, environment)**

Example Output:
```plaintext
Event: button_tap
Data: {
  "widgetType": "ElevatedButton",
  "label": "Tap Me",
  "timestamp": "2025-01-15T12:34:56Z",
  "device": {
    "os": "android",
    "version": "12"
  },
  "app": {
    "version": "1.0.0",
    "environment": "production"
  }
}
```

### Custom Collectors
To send events to your preferred analytics platform, implement the `DataCollector` interface and register your collector:
```dart
class CustomCollector implements DataCollector {
  @override
  void logEvent(String eventName, Map<String, dynamic> eventData) {
    print("Custom Event: $eventName, Data: $eventData");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAnalytics("assets/analytics_config.json");

  AnalyticsService.registerCollector(CustomCollector());
  runApp(AnalyticsRoot(child: MyApp()));
}
```

### Offline Buffering
Events are automatically stored offline when network connectivity is unavailable. To test this functionality:
```dart
import 'offline_buffer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAnalytics("assets/analytics_config.json");

  OfflineBuffer.addEvent({
    "eventName": "offline_test",
    "eventData": {"key": "value"}
  });

  runApp(AnalyticsRoot(child: MyApp()));
}
```

---

## Testing the SDK

1. **Run the Example App**
   Interact with buttons, text fields, switches, and gestures in your app to see events logged in the console.

2. **View Logged Events**
   Open your IDE’s debug console or terminal to view event logs. Ensure events are being tracked with proper metadata.

3. **Customize Configuration**
   Modify `analytics_config.json` to test different behaviors, such as excluding widgets or disabling gesture tracking.

---

## Contributing
We welcome contributions to make this SDK even more dynamic and versatile. To contribute:
1. Fork the repository.
2. Create a new branch for your feature/fix.
3. Submit a pull request with detailed documentation of your changes.

---

## License
This SDK is licensed under the MIT License. See `LICENSE` for details.

---

Crafted with precision and care by a fellow developer passionate about developer productivity and comfort.
