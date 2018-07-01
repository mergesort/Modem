import UIKit

struct PopoverConfiguration {
    
    enum Source {
        case barButtonItem(UIBarButtonItem)
        case view(UIView)
    }
    
    let source: Source
    let arrowDirection: UIPopoverArrowDirection
    let delegate: UIPopoverPresentationControllerDelegate?
    
}
