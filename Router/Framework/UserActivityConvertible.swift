import Foundation

protocol UserActivityConvertible {

    var userActivity: NSUserActivity { get }
    
}

protocol CustomUserActivityConvertible: UserActivityConvertible & Codable {

    var activityTitle: String { get }
    var activityType: UserActivityType { get }

}

extension CustomUserActivityConvertible {
    
    var userActivity: NSUserActivity {
        guard let data = try? JSONEncoder().encode(self) else { fatalError("Failed to derive data from encoded version of self!") }
        guard let userInfo = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [ AnyHashable : Any ] else { fatalError("Failed decoding a Decodable object!") }

        let activity = NSUserActivity(activityType: self.activityType.identifier)
        activity.title = self.activityTitle
        activity.userInfo = userInfo

        return activity
    }
    
}

extension NSUserActivity {
    
    func asActivityConvertible<T: CustomUserActivityConvertible>(ofType: T.Type = T.self) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: self.userInfo ?? [:], options: .prettyPrinted)
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    }
    
}
