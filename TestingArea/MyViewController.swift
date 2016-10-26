import UIKit
import DropDown
import EZSwiftExtensions

class MyViewController: UIViewController {
    var a: A!
    var b: B!
    
    override func viewDidLoad() {
        a = A()
        b = B()
        a.b = b
        b.a = a
    }
    
    @IBOutlet var anchor: UIView!
    let dropDown = DropDown()
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        dropDown.anchorView = self.anchor
        dropDown.dataSource = ["Item1", "Item2", "Item3", "Really Looong Item"]
//        dropDown.width = view.w - 100
        dropDown.direction = .bottom
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = {
            [unowned self] index, item in
            print(item)
        }
        dropDown.show()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
    }
}

class A {
    var b: B!
}

class B {
    var a: A!
}
