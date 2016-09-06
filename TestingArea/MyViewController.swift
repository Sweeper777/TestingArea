import UIKit
import MapKit
import EZSwiftExtensions

class MyViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func valueChanged(sender: UITextField) {
        print("Changed")
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        textField.text = "Hello"
    }
}
