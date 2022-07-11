#import "ShareItSuperPlusPlugin.h"
#if __has_include(<share_it_super_plus/share_it_super_plus-Swift.h>)
#import <share_it_super_plus/share_it_super_plus-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "share_it_super_plus-Swift.h"
#endif

@implementation ShareItSuperPlusPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShareItSuperPlusPlugin registerWithRegistrar:registrar];
}
@end
