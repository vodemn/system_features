import 'dart:async';

import 'package:flutter/services.dart';

class SystemFeatures {
  static const MethodChannel _channel = const MethodChannel('system_features');

  static Future<bool> get camera async {
    final bool tmp = await _channel.invokeMethod('camera');
    return tmp;
  }

  static Future<bool> get camera2 async {
    final bool tmp = await _channel.invokeMethod('camera2');
    return tmp;
  }

  static Future<bool> get sensor async {
    final bool tmp = await _channel.invokeMethod('sensor');
    return tmp;
  }
}
