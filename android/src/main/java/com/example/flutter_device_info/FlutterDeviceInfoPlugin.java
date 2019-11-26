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
    if (call.method.equals("getDeviceType")) {
      PackageManager pm = context.getPackageManager();
      result.success(pm.hasSystemFeature(PackageManager.FEATURE_TOUCHSCREEN));

    }else {
      result.notImplemented();
    }
  }
}
