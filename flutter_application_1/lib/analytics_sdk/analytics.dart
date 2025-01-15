library analytics_sdk;

import 'package:flutter/material.dart';
import 'analytics_config.dart';
import 'analytics_service.dart';
import 'gesture_interceptor.dart';

/// The root widget that initializes analytics and intercepts interactions.
class AnalyticsRoot extends StatelessWidget {
  final Widget child;

  const AnalyticsRoot({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureInterceptor(child: child);
  }
}

/// Initialize analytics by loading configuration and preparing services.
Future<void> initializeAnalytics(String configPath) async {
  await AnalyticsConfig.loadConfig(configPath);
  AnalyticsService.initialize();
}
