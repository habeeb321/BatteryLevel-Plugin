import 'package:flutter/services.dart';

import 'battery_level_platform_interface.dart';

class BatteryLevel {
  Future<String?> getPlatformVersion() {
    return BatteryLevelPlatform.instance.getPlatformVersion();
  }

  static const MethodChannel _channel =
      MethodChannel('org.rudderstack.dev/battery');

  // Get battery level.
  static Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    return batteryLevel;
  }
}
