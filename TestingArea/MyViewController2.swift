import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast

class MyViewController2: UIViewController {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if self.slideMenuController()!.isRightOpen() {
//            self.slideMenuController()!.closeRight()
//        } else {
//            self.slideMenuController()!.openRight()
//        }
        view1.makeToast("Message1", duration: 1, position: ASToastPosition.ASToastPositionBotom as AnyObject?, backgroundColor: nil, titleColor: nil, messageColor: nil)
        view2.makeToast("Message2", duration: 2, position: ASToastPosition.ASToastPositionCenter as AnyObject?, backgroundColor: nil, titleColor: nil, messageColor: nil)
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Hello")
    }
}
