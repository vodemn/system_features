import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_features/system_features.dart';

void main() {
  const MethodChannel channel = MethodChannel('system_features');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SystemFeatures.camera, '42');
  });
}
