import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import pop

class MyViewController2: UIViewController {
    
    @IBOutlet var view1: UIView!
    
    override func viewDidLoad() {
        let anim = POPSpringAnimation()
        anim.fromValue = 0
        anim.toValue = 1
        view1.layer.pop_add(anim, forKey: "borderWidth")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if self.slideMenuController()!.isRightOpen() {
//            self.slideMenuController()!.closeRight()
//        } else {
//            self.slideMenuController()!.openRight()
//        }
        view1.makeToast(message: "Message1", duration: 3, position: .bottom, backgroundColor: nil, messageColor: nil)
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Hello")
    }
}
