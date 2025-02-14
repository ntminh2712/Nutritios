//
//  AppDelegate.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import Messages
import FirebaseMessaging
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure() // gọi hàm để cấu hình 1 app Firebase mặc định
        Messaging.messaging().delegate = self //Nhận các message từ FirebaseMessaging
        checkLogin()
        configApplePush(application)
        return true
    }
    
    
    
    func checkLogin(){
        if LoginEntity.getToken() != nil {
            let vc = MAIN_STORYBOARD_INSTANCE.instantiateViewController(withIdentifier: "mainTapViewController") as! MainTapViewController
            let navi = UINavigationController(rootViewController: vc)
            navi.isNavigationBarHidden = true
            self.window?.rootViewController = navi
        }else {
            let vc = MAIN_STORYBOARD_INSTANCE.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
            let navi = UINavigationController(rootViewController: vc)
            navi.isNavigationBarHidden = true
            self.window?.rootViewController = navi
        }
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
    }
    func configApplePush(_ application: UIApplication) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        if let token = Messaging.messaging().fcmToken {
            print("FCM token: \(token)")
            
        }
    }
    
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("FCM token: \(fcmToken)")
        FcmTokenEntity.saveFcmToken(fcmToken)
    }
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        //Nhận được fcmToken,lưu lại và gửi lên back-end khi làm app thực tế
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let info = response.notification.request.content.userInfo
        if let notiStr = info["type"] as? String{
            if notiStr == "question" {
                if let token = LoginEntity.getToken()?.replacingOccurrences(of: "Bearer ", with: "") {
                    guard let url = URL(string: "http://anlanhmanh.com/user/eat?userId=\(token)") else {
                        return
                    }
                    UIApplication.shared.open(url)
                }
            }else {
                
            }
        }
        print(response.actionIdentifier)
        // tell the app that we have finished processing the user’s action / response
        completionHandler()
        
        
    }
    
    func convertToJson(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}

