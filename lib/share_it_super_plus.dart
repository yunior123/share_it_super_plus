import 'models/share_data.dart';
import 'share_it_super_plus_platform_interface.dart';

class ShareItSuperPlus {
  Future<String?> presentShareSheet(ShareData shareData) {
    return ShareItSuperPlusPlatform.instance.presentShareSheet(shareData);
  }
}
