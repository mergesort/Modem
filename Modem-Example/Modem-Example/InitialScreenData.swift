//
//  InitialScreenData.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/30/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import Foundation

struct InitialScreenData: Codable, CustomUserActivityConvertible {

    let activityTitle = "InitialScreen"
    let activityType = UserActivityType.custom("com.mergesort.modemExample.initialScreen")

    enum CodingKeys: CodingKey {
        case text
    }

    let text: String

    var userActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: self.activityType.identifier)
        userActivity.title = "Initial Screen"
        userActivity.userInfo = self.dictionary

        return userActivity
    }

}
