import UIKit
import Flutter
import PushKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    UIApplication.shared.registerForRemoteNotifications()
    
    
    UNUserNotificationCenter.current().delegate = self
    
      
    
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.setNotificationCategories([
        createOrderCategory(),
        createUsualAndForegroundCategory(),
        createInputCategory()
    ])
    
    
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenComponents = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let deviceTokenString = tokenComponents.joined()
        print("deviceTokenString \(deviceTokenString)")
    }
    
}


extension AppDelegate {
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("action id \(response.actionIdentifier)")
        if(response.actionIdentifier == "input_action") {
            print("text \((response as? UNTextInputNotificationResponse)!.userText)")
        }
        
    }
}


