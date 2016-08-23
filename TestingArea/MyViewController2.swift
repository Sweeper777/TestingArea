import UIKit
import AVFoundation
import EZSwiftExtensions

class MyViewController2: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var recognizer: UISwipeGestureRecognizer!
    @IBAction func item(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
