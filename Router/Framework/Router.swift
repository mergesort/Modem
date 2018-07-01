import UIKit

struct Router {
    
    static var items: [Route] = []
    
    static func navigate(from viewController: UIViewController, to route: Route, withAction presentationItem: PresentationAction) {
        self.items.append(route)
        
        switch presentationItem {
            
        case .custom(let delegate):
            break
            
        case .popover(let configuration):
            break

        case .present(let animated, let completion):
            viewController.present(route.destination, animated: animated, completion: completion)
            
        case .push(let animated):
            viewController.navigationController?.pushViewController(route.destination, animated: animated)
            
        case .show(let sender):
            viewController.show(route.destination, sender: sender)
            
        case .showDetail(let sender):
            viewController.showDetailViewController(route.destination, sender: sender)
            
        }
    }
    
    static func navigate(with dismissItem: DismissAction) {
        _ = self.items.popLast()
        
        switch dismissItem {

        case .dismiss(let viewController, let animated, let completion):
            viewController.dismiss(animated: animated, completion: completion)
            
        case .pop(let navigationController, let animated):
            navigationController.popViewController(animated: animated)

        }
    }
}
