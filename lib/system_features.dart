import 'dart:async';

import 'package:flutter/services.dart';

class SystemFeatures {
  static const MethodChannel _channel =
      const MethodChannel('system_features');

  static Future<bool> get touchscreen async {
    final bool tmp = await _channel.invokeMethod('touchscreen');
    return tmp;
  }

  static Future<bool> get camera async {
    final bool tmp = await _channel.invokeMethod('camera');
    return tmp;
  }

  static Future<bool> get camera2 async {
    final bool tmp = await _channel.invokeMethod('camera2');
    return tmp;
  }

  static Future<bool> get phone async {
    final bool tmp = await _channel.invokeMethod('phone');
    return tmp;
  }

  static Future<bool> get faketouch async {
    final bool tmp = await _channel.invokeMethod('faketouch');
    return tmp;
  }

  static Future<bool> get nfc async {
    final bool tmp = await _channel.invokeMethod('nfc');
    return tmp;
  }

  static Future<bool> get microphone async {
    final bool tmp = await _channel.invokeMethod('microphone');
    return tmp;
  }

  static Future<bool> get sensor async {
    final bool tmp = await _channel.invokeMethod('sensor');
    return tmp;
  }

  static Future<bool> get leanback async {
    final bool tmp = await _channel.invokeMethod('leanback');
    return tmp;
  }

  static Future<bool> get isGoogleTv async {
    final bool version = await _channel.invokeMethod('isGoogleTV');
    return version;
  }
}
