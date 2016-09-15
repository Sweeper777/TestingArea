import UIKit

class MyViewController: UIViewController {
    @IBOutlet var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        performSegueWithIdentifier("show", sender: self)
        NSTimer.runThisAfterDelay(seconds: 3) {
            [weak self] in
            self?.myView.hidden = true
        }
    }
}
