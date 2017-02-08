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
    
    func test1() {
        let someView = UIView()
        someView.backgroundColor = UIColor.green
        someView.width = 100
        someView.height = 100
        print(type(of: textField.inputView))
        textField.inputAccessoryView = someView
    }
    
    func test2() {
        let someView = UIView()
        someView.backgroundColor = UIColor.green
        someView.width = 100
        someView.height = 100
        textField.inputView = someView
    }
    
    func test3() {
        let someView = UIToolbar(frame: CGRect.zero.with(height: 40))
        someView.items = [UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(buttonTapped))]
        textField.inputAccessoryView = someView
    }
}
