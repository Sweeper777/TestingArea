import UIKit
import SwiftyUtils
import SnapKit
import SwiftyJSON

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        }
        
        }
    }
    
    @IBAction func click() {
        let jsonString = """
[
{
"sno": "21",
"title": "title 1",
"tableid": "table 1"
},
{
"sno": "19",
"title": "title 222",
"tableid": "table 222"
},
{
"sno": "3",
"title": "title 333",
"tableid": "table 333"
}
]
"""
        let json = JSON(parseJSON: jsonString)
        print(json[0]["sno"].string)
    }
    
    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        if view.bounds.width < view.bounds.height {
            return UITraitCollection(horizontalSizeClass: .compact)
        } else {
            return UITraitCollection(horizontalSizeClass: .regular)
        }
    }
}
