import 'package:flutter/material.dart';
import 'dart:async';

import 'package:system_features/system_features.dart';

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
  bool camera2 = true;
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
    camera = await SystemFeatures.camera;
    camera2 = await SystemFeatures.camera2;
    sensor = await SystemFeatures.sensor;

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
              Text('Camera2: $camera2\n'),
              Text('sensor: $sensor\n'),
            ],
          ),
        ),
      ),
    );
  }
}
