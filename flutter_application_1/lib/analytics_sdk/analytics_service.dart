import 'data_collector.dart';
import 'metadata_enrichment.dart';

/// Central service for tracking and dispatching analytics events.
class AnalyticsService {
  static final List<DataCollector> _collectors = [];

  static void initialize() {
    // Optionally register default collectors here
    // Example: registerCollector(FirebaseCollector());
  }

  static void registerCollector(DataCollector collector) {
    _collectors.add(collector);
  }

  static void trackEvent(String eventName, Map<String, dynamic> data) {
    final enrichedData = MetadataEnrichment.enrichEvent(data);
    for (final collector in _collectors) {
      collector.logEvent(eventName, enrichedData);
    }
  }
}
