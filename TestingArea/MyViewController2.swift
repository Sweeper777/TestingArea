import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import pop
import NGORoundedButton

class MyViewController2: UIViewController {
    
    @IBOutlet var view1: UILabel!
    @IBOutlet var view2: UILabel!
    @IBOutlet var view3: UIView!
    
    var i = 0
    var j = 0
    
    override func viewDidLoad() {
        let button = NGORoundedButton(buttonCustomImage: UIImage(named: "home"), andShape: .circle)!
        button.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: button.size)
        self.view.addSubview(button)
        
        button.width = 44
        button.height = 44
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        let closure: (Timer) -> Void = { (timer) -> Void in
            print("Hello")
            timer.invalidate()
        }
        _ = Timer.every(1, closure)
    }
    
    func buttonClicked(sender: NGORoundedButton) {
        sender.customImage = UIImage(named: "settings")
    }
    
    func test1() {
        let anim = POPSpringAnimation()
        anim.fromValue = 0
        anim.toValue = 30
        anim.velocity = 0.1
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
    
    func a() {
        view1.text = self.i.description
        self.i += 1
    }
}
