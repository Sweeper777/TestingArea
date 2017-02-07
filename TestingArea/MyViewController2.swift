import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import pop
import NGORoundedButton
import LTMorphingLabel

class MyViewController2: UIViewController {
    @IBOutlet var label: LTMorphingLabel!
    
    override func viewDidLoad() {
        label.morphingEffect = .evaporate
        Timer.runThisAfterDelay(seconds: 3) {
            self.label.text = "60:00"
        }
    }
}
