import UIKit

class MyVC: UIViewController {

    @IBOutlet var myView: UIView!
    
    override func viewDidLoad() {
        print(myView == childViewControllers[0].view)
    }
}
