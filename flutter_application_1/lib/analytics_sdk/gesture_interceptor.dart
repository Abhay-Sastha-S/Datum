import 'package:flutter/material.dart';
import 'analytics_service.dart';

/// Intercepts global gestures and tracks them as events.
class GestureInterceptor extends StatelessWidget {
  final Widget child;

  const GestureInterceptor({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        AnalyticsService.trackEvent("gesture", {
          "type": "tap",
          "position": {"x": event.position.dx, "y": event.position.dy}
        });
      },
      child: child,
    );
  }
}
