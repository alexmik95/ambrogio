import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Provide the GoogleMaps API key.
    NSString* mapsApiKey = [[NSProcessInfo processInfo] environment][@"MAPS_API_KEY"];
    if ([mapsApiKey length] == 0) {
      mapsApiKey = @"YOUR_APK_KEY_HERE";
    }
    [GMSServices provideAPIKey:mapsApiKey];

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
