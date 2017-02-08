import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import pop
import NGORoundedButton
import LTMorphingLabel
import RFKeyboardToolbar

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
    
    func test4() {
        let button1 = RFToolbarButton(title: "Test1", andEventHandler: {
            print(self.textField.selectedTextRange!)
        }, for: .touchUpInside)
        
        textField.inputAccessoryView = RFKeyboardToolbar(buttons: [button1!, button2!])
    }
extension UITextInput {
    var selectedRange: NSRange? {
        guard let range = self.selectedTextRange else { return nil }
        let location = offset(from: beginningOfDocument, to: range.start)
        let length = offset(from: range.start, to: range.end)
        return NSRange(location: location, length: length)
    }
}

}
