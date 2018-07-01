// Every app should build a table of possible user activities, which are entry points.

enum UserActivityType {
    
    case custom(String)
    case notification
}

extension UserActivityType {
    
    var identifier: String {
        switch self {
            
        case .custom(let activityType):
            return activityType
            
        case .notification:
            return "notification"
        }
    }
    
}
