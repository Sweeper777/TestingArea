import UIKit
import SwiftyUtils
import RxSwift
import MaterialComponents

class MyViewController2: UIViewController, UITextFieldDelegate {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = MDCFloatingButton(shape: .default)
        button.frame = CGRect.zero.with(x: 39).with(y: 260).with(width: 50).with(height: 50)
        button.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        button.backgroundColor = UIColor(hex: "5abb5a")
        self.view.addSubview(button)
        textfield.placeholder = "Hello"
        textfield.text = "‌"
        textfield.clearButtonMode = .unlessEditing
        textfield.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.clearButtonMode = .unlessEditing
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.clearButtonMode = .whileEditing
    }
}
