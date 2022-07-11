import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'models/share_data.dart';
import 'share_it_super_plus_platform_interface.dart';

/// An implementation of [ShareItSuperPlusPlatform] that uses method channels.
class MethodChannelShareItSuperPlus extends ShareItSuperPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('share_it_super_plus');

  @override
  Future<String?> presentShareSheet(ShareData shareData) async {
    final result = await methodChannel.invokeMethod<String>(
      'share_file',
      shareData.toMap(),
    );
    return result;
  }
}
