import UserNotifications

// This one should likely be configurable based on how your app's payload is constructed

extension UNNotificationContent: UserActivityConvertible {
    
    var userActivity: NSUserActivity {
        // Maybe consider using self.categoryIdentifier or something else entirely?
        let userActivity = NSUserActivity(activityType: "TEST")
        userActivity.title = self.title
        userActivity.userInfo = self.userInfo
        
        return userActivity
    }
    
}
