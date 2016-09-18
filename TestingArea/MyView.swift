
import UIKit

class MyView: UIView {
    var view2: UIView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches.first!.location(in: view2))
    }

    override func draw(_ rect: CGRect) {
        view2 = UIButton(frame: CGRect(x: 30, y: 30, width: 30, height: 30))
        view2.isUserInteractionEnabled = false
        view2.backgroundColor = UIColor.blue
        self.addSubview(view2)
    }
}
