package com.vodemn.flutter_device_info;

import android.app.Activity;
import android.content.pm.PackageManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterDeviceInfoPlugin */
public class FlutterDeviceInfoPlugin implements MethodCallHandler {
  /** Plugin registration. */

  Activity context;
  MethodChannel methodChannel;

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_device_info");
    channel.setMethodCallHandler(new FlutterDeviceInfoPlugin(registrar.activity(), channel));
  }

  public FlutterDeviceInfoPlugin(Activity activity, MethodChannel methodChannel) {
    this.context = activity;
    this.methodChannel = methodChannel;
    this.methodChannel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {

    PackageManager pm = context.getPackageManager();
    switch (call.method) {
    case "touchscreen":
      result.success(pm.hasSystemFeature(PackageManager.FEATURE_TOUCHSCREEN));
      break;
    case "camera":
      result.success(pm.hasSystemFeature("android.hardware.camera"));
      break;
    case "phone":
      result.success(pm.hasSystemFeature("android.hardware.telephony"));
      break;
    case "faketouch":
      result.success(pm.hasSystemFeature("android.hardware.faketouch"));
      break;
    case "nfc":
      result.success(pm.hasSystemFeature("android.hardware.nfc"));
      break;
    case "microphone":
      result.success(pm.hasSystemFeature("android.hardware.microphone"));
      break;
    case "sensor":
      result.success(pm.hasSystemFeature("android.hardware.microphone"));
      break;
    case "leanback":
      result.success(pm.hasSystemFeature("android.software.leanback"));
      break;
    case "isGoogleTV":
      result.success(pm.hasSystemFeature("com.google.android.tv"));
      break;

    default:
      result.notImplemented();
      break;
    }
  }
}
