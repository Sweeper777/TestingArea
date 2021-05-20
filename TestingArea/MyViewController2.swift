import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils
import SwiftUI
import Alamofire

@available(iOS 10.0, *)
class MyViewController2: UIViewController, UITextFieldDelegate {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var label: UILabel!
    @IBOutlet var c1: NSLayoutConstraint!
    @IBOutlet var c2: NSLayoutConstraint!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        textfield.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        NSLayoutConstraint.deactivate([c1, c2])
        label.translatesAutoresizingMaskIntoConstraints = true
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        }
    }
    
    @IBAction private func click() {
    label.translatesAutoresizingMaskIntoConstraints = false
    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
        NSLayoutConstraint.activate([self.c1, self.c2])
        self.view.layoutIfNeeded()
    }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("")
    }
    
    let katakanas =
        "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン"
    let hiraganas =
        "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん"
    @objc func textFieldChanged() {
//        print(textfield.markedTextRange)
        let newString = textfield.text ?? ""
        if !(newString.count == 1 &&
                katakanas.contains(newString.first!)) && textfield.markedTextRange == nil {
            textfield.text = ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let firstChar = textField.text?.first,
           (katakanas.contains(firstChar)) && string != "" {
            return false
        }
        return true
    }
}
