import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:share_it_super_plus/share_it_super_plus_method_channel.dart';

void main() {
  MethodChannelShareItSuperPlus platform = MethodChannelShareItSuperPlus();
  const MethodChannel channel = MethodChannel('share_it_super_plus');

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
    // expect(await platform.getPlatformVersion(), '42');
  });
}
