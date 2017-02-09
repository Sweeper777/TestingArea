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
    
    var textField: UITextView!
    
    override func viewDidLoad() {
        label.morphingEffect = .evaporate
        Timer.runThisAfterDelay(seconds: 3) {
            self.label.text = "60:00"
        }
    
        textField = UITextView(x: 20, y: 200, w: 200, h: 100)
        textField.backgroundColor = UIColor.gray
        textField.isEditable = true
        self.view.addSubview(textField)
        
        test4()
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
        
        let button2 = RFToolbarButton(title: "Test2", andEventHandler: {
            self.textField.insertText("****")
            var range = self.textField.selectedRange!
            range.location -= 2
            self.textField.selectedTextRange = range.toTextRange(textInput: self.textField)
            self.textField.insertText("iatlic text here")
            let endPos = self.textField.selectedRange!.location
            self.textField.selectedTextRange = NSRange(location: endPos - 16, length: 16).toTextRange(textInput: self.textField)
        }, for: .touchUpInside)
        
        let button3 = RFToolbarButton(title: "Test3", andEventHandler: {
            let range: UITextRange? = self.textField.selectedTextRange
            let rect: CGRect? = self.textField.caretRect(for: (range?.start)!)
            let halfLineHeight: CGFloat = self.textField.font!.lineHeight / 2.0
            let start: UITextPosition? = self.textField.closestPosition(to: CGPoint(x: CGFloat(0), y: CGFloat(rect!.origin.y + halfLineHeight)))
            self.textField
                .selectedTextRange = self.textField.textRange(from: start!, to: start!)
        }, for: .touchUpInside)
        
        textField.inputAccessoryView = RFKeyboardToolbar(buttons: [button1!, button2!, button3!])
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.makeToast(message: "Hello", duration: 3, backgroundColor: nil, messageColor: nil)
    }
extension UITextInput {
    var selectedRange: NSRange? {
        guard let range = self.selectedTextRange else { return nil }
        let location = offset(from: beginningOfDocument, to: range.start)
        let length = offset(from: range.start, to: range.end)
        return NSRange(location: location, length: length)
    }
}

extension NSRange {
    func toTextRange(textInput:UITextInput) -> UITextRange? {
        if let rangeStart = textInput.position(from: textInput.beginningOfDocument, offset: location),
            let rangeEnd = textInput.position(from: rangeStart, offset: length) {
            return textInput.textRange(from: rangeStart, to: rangeEnd)
        }
        return nil
    }
}
