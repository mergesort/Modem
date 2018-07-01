import UIKit

struct Route {

    let destination: UIViewController
    let activity: NSUserActivity

    init(destination: UIViewController, activity: UserActivityConvertible) {
        self.destination = destination
        self.activity = activity.userActivity
    }
    
    init(destination: UIViewController, activity: NSUserActivity) {
        self.destination = destination
        self.activity = activity
    }
    
}
