//
//  AppDelegate.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/1/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let notification = launchOptions?[.remoteNotification] as? [String: AnyObject] {
            // handle launch options variant on iOS 9 and below
        } else {
            // handle regular app launch here
        }

        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        let userActivityViewController = UserActivityViewController(userActivity: userActivity)
        let route = Route(destination: userActivityViewController, activity: userActivity)

        Router.navigate(from: application.keyWindow!.rootViewController!, to: route, withAction: .present(animated: true, completion: nil))

        return true
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let content = response.notification.request.content
        let notificationViewController = UNNotificationContentViewController(notificationContent: content)
        let route = Route(destination: notificationViewController, activity: content)

        Router.navigate(from: self.window!.rootViewController!, to: route, withAction: .present(animated: true, completion: nil))
    }

}
