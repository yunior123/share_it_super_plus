import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'models/share_data.dart';
import 'share_it_super_plus_method_channel.dart';

abstract class ShareItSuperPlusPlatform extends PlatformInterface {
  static final Object _token = Object();

  static ShareItSuperPlusPlatform _instance = MethodChannelShareItSuperPlus();

  /// The default instance of [ShareItSuperPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelShareItSuperPlus].
  static ShareItSuperPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShareItSuperPlusPlatform] when
  /// they register themselves.
  static set instance(ShareItSuperPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Constructs a ShareItSuperPlusPlatform.
  ShareItSuperPlusPlatform() : super(token: _token);

  Future<String?> presentShareSheet(ShareData shareData) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
