import UIKit

enum PresentationAction {
    
    case custom(delegate: UIViewControllerTransitioningDelegate)
    case popover(configuration: PopoverConfiguration)
    case present(animated: Bool, completion: (() -> Void)?)
    case push(animated: Bool)
    case show(sender: Any?)
    case showDetail(sender: Any?)
}

enum DismissAction {

    case dismiss(UIViewController, animated: Bool, completion: (() -> Void)?)
    case pop(UINavigationController, animated: Bool)

}
