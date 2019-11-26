import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDeviceInfo {
  static const MethodChannel _channel =
      const MethodChannel('flutter_device_info');

  static Future<bool> get platformVersion async {
    final bool version = await _channel.invokeMethod('getDeviceType');
    return version;
  }
}
