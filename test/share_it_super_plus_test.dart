// import 'package:flutter_test/flutter_test.dart';
// import 'package:share_it_super_plus/share_it_super_plus.dart';
// import 'package:share_it_super_plus/share_it_super_plus_platform_interface.dart';
// import 'package:share_it_super_plus/share_it_super_plus_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockShareItSuperPlusPlatform 
//     with MockPlatformInterfaceMixin
//     implements ShareItSuperPlusPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final ShareItSuperPlusPlatform initialPlatform = ShareItSuperPlusPlatform.instance;

//   test('$MethodChannelShareItSuperPlus is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelShareItSuperPlus>());
//   });

//   test('getPlatformVersion', () async {
//     ShareItSuperPlus shareItSuperPlusPlugin = ShareItSuperPlus();
//     MockShareItSuperPlusPlatform fakePlatform = MockShareItSuperPlusPlatform();
//     ShareItSuperPlusPlatform.instance = fakePlatform;
  
//     expect(await shareItSuperPlusPlugin.getPlatformVersion(), '42');
//   });
// }
