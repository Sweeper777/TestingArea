import UIKit

class AnotherViewController: UIViewController {

    override func viewDidLoad() {
        print("viewDidLoad")
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
}
