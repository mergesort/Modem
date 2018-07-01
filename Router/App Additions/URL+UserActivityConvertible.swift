import Foundation

extension URL: UserActivityConvertible {

    var userActivity: NSUserActivity {
        // Define your own parsing structure in here
        // you can make a parser that converts urls into NSUserActivity,
        // much like you would have to for universal links
        // but here it'll be explicit and map for all URLs
        let userActivity = NSUserActivity(activityType: "")
        return userActivity
    }
    
}
