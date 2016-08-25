import UIKit
import AVFoundation
import EZSwiftExtensions
import ISHHoverBar

class MyViewController2: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var recognizer: UISwipeGestureRecognizer!
    
    @IBOutlet var item1: UIBarButtonItem!
    @IBOutlet var item2: UIBarButtonItem!
    
    @IBAction func item(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        let bar = ISHHoverBar(frame: CGRectMake(20, 200, 44, 88))
        bar.orientation = .Vertical
        bar.borderColor = UIColor(hexString: "3b7b3b")
        bar.items = [item1, item2]
        view.addSubview(bar)
    }
}
