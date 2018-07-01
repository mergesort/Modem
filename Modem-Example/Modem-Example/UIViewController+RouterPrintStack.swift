//
//  UIViewController+RouterPrintStack.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/1/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UIKit

extension UIViewController {

    func printRouterStack() {
        Router.items
            .map { $0.activity }
            .forEach { print($0.debugDescription) }
    }

}

extension NSUserActivity {

    open override var debugDescription: String {
        do {
            return """
            ActivityType: \(self.activityType)
            Title: \(self.title ?? "")
            UserInfo: \(self.userInfo ?? [:])
            Converted type: \(try self.asActivityConvertible(ofType: Tweet.self))
            """
        } catch {
            return """
            ActivityType: \(self.activityType)
            Title: \(self.title ?? "")
            UserInfo: \(self.userInfo ?? [:])
            """
        }
    }

}
