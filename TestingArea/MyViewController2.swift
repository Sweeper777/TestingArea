import UIKit
import SwiftyUtils

class MyViewController2: UIViewController {
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print(iterateEnum(Foo.self).next())
    }
}

enum Foo: Iteratable {
    case a, b, c, d
}
