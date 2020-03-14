import UIKit
import Alamofire
import HTMLReader
import WKWebViewCrawler
import Realm
import RealmSwift

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
        
        try! RealmWrapper.shared.realm.write {
            let a = Entity()
            a.kids.append("Hello")
            a.kids.append("thingOne")
            let b = Entity()
            b.kids.append("Hello")
            
            RealmWrapper.shared.realm.add(a)
            RealmWrapper.shared.realm.add(b)
        }
        print(RealmWrapper.shared.entities.filter("%@ IN kids", "thingOne").count)
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
