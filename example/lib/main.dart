import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_device_info/flutter_device_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool touchscreen = true;
  bool faketouch = true;
  bool nfc = true;
  bool isGoogleTv = true;
  bool phone = true;
  bool camera = true;
  bool microphone = true;
  bool leanback = true;
  bool sensor = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    touchscreen = await FlutterDeviceInfo.touchscreen;
    faketouch = await FlutterDeviceInfo.faketouch;
    camera = await FlutterDeviceInfo.camera;
    nfc = await FlutterDeviceInfo.nfc;
    microphone = await FlutterDeviceInfo.isGoogleTv;
    phone = await FlutterDeviceInfo.isGoogleTv;
    camera = await FlutterDeviceInfo.camera;
    sensor = await FlutterDeviceInfo.sensor;
    leanback = await FlutterDeviceInfo.leanback;
    isGoogleTv = await FlutterDeviceInfo.isGoogleTv;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Camera: $camera\n'),
              Text('sensor: $sensor\n'),
              Text('touchscreen: $touchscreen\n'),
              Text('faketouch: $faketouch\n'),
              Text('nfc: $nfc\n'),
              Text('phone: $phone\n'),
              Text('microphone: $microphone\n'),
              Text('leanback: $leanback\n'),
              Text('isGoogleTv: $isGoogleTv\n'),
            ],
          ),
        ),
      ),
    );
  }
}
