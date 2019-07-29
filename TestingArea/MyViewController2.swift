import UIKit
import SwiftyUtils
import Contacts
import ContactsUI
import Alamofire
import DifferenceKit

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var coolButton: UIButton!

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coolButton.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    @IBAction func click() {
        let old = ["A", "B", "C", "D"]
        let new = ["B", "C", "A", "D"]
        
        let changeset = StagedChangeset(source: old, target: new)
        for change in changeset {
            print(change)
        }
    }
}

extension String: Differentiable {}
