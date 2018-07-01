import UIKit

extension UIApplicationShortcutItem: UserActivityConvertible {
    
    // I'd match this up to a specific NSUserActivityType, but if you don't
    // then you have the option of moving this into the App folder and
    // manually configuring it
    var userActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: self.type)
        userActivity.title = self.localizedTitle
        userActivity.userInfo = self.userInfo
        
        return userActivity
    }
    
}
