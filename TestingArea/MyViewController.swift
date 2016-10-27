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
        let date = Date()
        UserDefaults.standard.set(date, forKey: "myDate")
    }
    
    @IBOutlet var anchor: UIView!
    let dropDown = DropDown()
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print(UserDefaults.standard.object(forKey: "myDate"))
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
