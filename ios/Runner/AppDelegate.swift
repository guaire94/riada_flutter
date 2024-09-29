import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    #if DEBUG
      GMSServices.provideAPIKey("AIzaSyB39gBobaddxI2LsI5rymEvbJbpmY4hqZc")
    #else
      GMSServices.provideAPIKey("AIzaSyDPH-SeNTV6bWb4nYNAQe8sLZREUxH0Dh0")
    #endif
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
