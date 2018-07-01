//
//  Tweet.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/1/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import Foundation

struct Tweet: Codable, CustomUserActivityConvertible {

    let activityTitle = "Tweet"
    let activityType = UserActivityType.custom("com.atebits.tweetie.tweet")

    enum CodingKeys: CodingKey {
        case statusId
        case text
    }

    let statusId: String
    let text: String

    var userActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: self.activityType.identifier)
        //        let userActivity = NSUserActivity(convertible: Tweet.self)
        userActivity.title = "This is a tweet or something"
        userActivity.userInfo = self.dictionary

        return userActivity
    }

}
