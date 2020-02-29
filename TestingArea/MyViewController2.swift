import UIKit
import Alamofire
import HTMLReader
import WKWebViewCrawler

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @UserDefaultsBacked(key: "snap-is-enabled", defaultValue: false)
    var snapStatus: Bool
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func click() {
        print(snapStatus)
        textfield.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
           self.textfield.transform = .identity
        }, completion: nil)
    }
}


@propertyWrapper struct UserDefaultsBacked<Value> {
    let key: String
    let storage: UserDefaults = .standard
    var defaultValue: Value

    var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set { storage.setValue(newValue, forKey: key) }
    }
}
