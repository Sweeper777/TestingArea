import UIKit
import ISHPullUp

class MyViewController: UIViewController, ISHPullUpStateDelegate, ISHPullUpSizingDelegate {
    
    @IBOutlet var pullUpHandle: ISHPullUpHandleView!
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
    }
}

