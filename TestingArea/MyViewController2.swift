import UIKit
import SwiftyUtils

private enum Letters {
    case a
    case b
    case c
    case d
    case e
}

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var imageView: UIImageView!

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    private var letters: [Letters] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        letters = [.a, .b, .c, .d, .e]
    }
    
    @IBAction func click() {
    }
    
    func test1() {
        let contact = CNMutableContact()
        contact.familyName = "Cheng"
        contact.givenName = "Xiu"
        contact.emailAddresses = [CNLabeledValue(label: "work", value: "xiu.cheng2001@gmail.com" as NSString)]
        let store = CNContactStore()
        
    }
    
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

    }
}
