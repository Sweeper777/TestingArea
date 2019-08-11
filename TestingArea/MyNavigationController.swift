import UIKit

class MyNavigationController : UINavigationController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("nav controller viewDidAppear")
    }
}
