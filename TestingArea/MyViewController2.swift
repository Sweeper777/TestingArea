import UIKit
import SwiftyUtils
import RxSwift
import SceneKit
import SwiftyJSON

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
        UserDefaults.standard.set(try! Customer().toJSON().rawData(), forKey: "my key")
        let customer = Customer.fromJSON(JSON(data: UserDefaults.standard.data(forKey: "my key")!))
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
}

class Customer: NSObject {
    
    var name: String!
    var age: Int!
    var address: String!
    
    func toJSON() -> JSON {
        return [
            "name": name,
            "age": age,
            "address": address
        ]
    }
    
    static func fromJSON(_ json: JSON) -> Customer {
        let customer = Customer()
        customer.name = json["name"].string
        customer.age = json["age"].int
        
    }
}
