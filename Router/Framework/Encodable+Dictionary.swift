import Foundation

extension Encodable {
    
    var dictionary: [AnyHashable : Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [ AnyHashable : Any ]
        } catch {
            return nil
        }
    }
    
}
