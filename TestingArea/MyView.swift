
import UIKit

class MyView: UIView {
    var view2: UIView!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(touches.first!.locationInView(view2))
    }

    override func drawRect(rect: CGRect) {
        view2 = UIView(frame: CGRectMake(30, 30, 30, 30))
        view2.backgroundColor = UIColor.blueColor()
        self.addSubview(view2)
    }
}
