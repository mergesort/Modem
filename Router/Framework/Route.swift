import UIKit

struct Route {

    let destination: UIViewController
    let activity: NSUserActivity
    let action: PresentationAction

    init(destination: UIViewController, activity: UserActivityConvertible, action: PresentationAction) {
        self.destination = destination
        self.activity = activity.userActivity
        self.action = action
    }
    
    init(destination: UIViewController, activity: NSUserActivity, action: PresentationAction) {
        self.destination = destination
        self.activity = activity
        self.action = action
    }
    
}
