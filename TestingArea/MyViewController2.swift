import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import pop
import NGORoundedButton
import LTMorphingLabel

class MyViewController2: UIViewController {
    @IBOutlet var label: LTMorphingLabel!
    
    var textField: UITextField!
    
    override func viewDidLoad() {
        label.morphingEffect = .evaporate
        Timer.runThisAfterDelay(seconds: 3) {
            self.label.text = "60:00"
        }
    
        textField = UITextField(x: 20, y: 200, w: 100, h: 30)
        textField.borderStyle = .roundedRect
        self.view.addSubview(textField)
    }
}
