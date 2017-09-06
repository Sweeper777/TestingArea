import UIKit
import MessageUI
import CoreData
import SwiftyUtils

class MyViewController: UIViewController {
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
//    override func viewDidLoad() {
//        if view.height < view.width {
//            NSLayoutConstraint.activate([widthConstraint])
//            NSLayoutConstraint.deactivate([heightConstraint])
//            stackView.axis = .horizontal
//        } else {
//            NSLayoutConstraint.deactivate([widthConstraint])
//            NSLayoutConstraint.activate([heightConstraint])
//            stackView.axis = .vertical
//        }
//    }
//    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        if size.height < size.width {
//            NSLayoutConstraint.activate([widthConstraint])
//            NSLayoutConstraint.deactivate([heightConstraint])
//            stackView.axis = .horizontal
//        } else {
//            NSLayoutConstraint.deactivate([widthConstraint])
//            NSLayoutConstraint.activate([heightConstraint])
//            stackView.axis = .vertical
//        }
//    }
}

