import UIKit

class MyNavigationController : UINavigationController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("nav controller viewDidAppear")
    }
}
