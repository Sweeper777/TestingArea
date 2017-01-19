import UIKit
import SwiftyUtils
import EZSwiftExtensions

class MyViewController2: UIViewController {
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    var n1 = 0
    var n2 = 0
    var t1: Timer!
    var t2: Timer!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.slideMenuController()!.isRightOpen() {
            self.slideMenuController()!.closeRight()
        } else {
            self.slideMenuController()!.openRight()
        }
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        t1 = Timer.runThisEvery(seconds: 1) {
            _ in
            self.label1.text = self.n1.description
            self.n1 += 1
        }
        
        t2 = Timer.every(1) {
            self.label2.text = self.n2.description
            self.n2 += 1
        }
    }
}
