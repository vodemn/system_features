#import "SystemFeaturesPlugin.h"
#if __has_include(<system_features/system_features-Swift.h>)
#import <system_features/system_features-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "system_features-Swift.h"
#endif

@implementation SystemFeaturesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSystemFeaturesPlugin registerWithRegistrar:registrar];
}
@end
