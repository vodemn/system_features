package com.vodemn.system_features;

import android.app.Activity;
import android.content.pm.PackageManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SystemFeaturesPlugin */
public class SystemFeaturesPlugin implements MethodCallHandler {
  Activity context;
  MethodChannel methodChannel;

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "system_features");
    channel.setMethodCallHandler(new SystemFeaturesPlugin(registrar.activity(), channel));
  }
  
  public SystemFeaturesPlugin(Activity activity, MethodChannel methodChannel) {
    this.context = activity;
    this.methodChannel = methodChannel;
    this.methodChannel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {

    PackageManager pm = context.getPackageManager();
    switch (call.method) {
    case "camera":
      result.success(pm.hasSystemFeature("android.hardware.camera"));
      break;
    case "camera2":
      result.success(pm.hasSystemFeature("android.hardware.camera2.capability.manual_sensor"));
      break;
    case "sensor":
      result.success(pm.hasSystemFeature("android.hardware.sensor.light"));
      break;

    default:
      result.notImplemented();
      break;
    }
  }
}
