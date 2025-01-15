import 'package:flutter/material.dart';
import 'analytics_sdk/analytics.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAnalytics("assets/analytics_config.json");
  runApp(AnalyticsRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Analytics Demo",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Analytics Demo")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Button Interaction
            ElevatedButton(
              onPressed: () {
                print("Button clicked");
              },
              child: Text("Tap Me"),
            ),

            SizedBox(height: 20),

            // TextField Interaction
            TextField(
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                print("Text input: $value");
              },
            ),

            SizedBox(height: 20),

            // Switch Interaction
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Enable Notifications"),
                Switch(
                  value: true,
                  onChanged: (value) {
                    print("Switch toggled: $value");
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            // Gesture Interaction (Swipe)
            GestureDetector(
              onHorizontalDragEnd: (details) {
                print("Swipe detected");
              },
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    "Swipe Here",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Checkbox Interaction
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Agree to Terms"),
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    print("Checkbox toggled: $value");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
