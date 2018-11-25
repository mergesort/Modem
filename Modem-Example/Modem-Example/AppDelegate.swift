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

    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let notification = launchOptions?[.remoteNotification] as? [String: AnyObject] {
            // handle launch options variant on iOS 9 and below
        } else {
            // handle regular app launch here
        }

        return true
    }

    private func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        let userActivityViewController = UserActivityViewController(userActivity: userActivity)
        let route = Route(
            destination: userActivityViewController,
            activity: userActivity,
            action: .present(animated: true, completion: nil)
        )

        Router.navigate(from: application.keyWindow!.rootViewController!, to: route)

        return true
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let content = response.notification.request.content
        let notificationViewController = UNNotificationContentViewController(notificationContent: content)
        let route = Route(
            destination: notificationViewController,
            activity: content,
            action: .present(animated: true, completion: nil)
        )

        Router.navigate(from: self.window!.rootViewController!, to: route)
    }

}
