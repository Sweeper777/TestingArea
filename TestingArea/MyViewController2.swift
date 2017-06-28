import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import RxSwift

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.text = "Testing Testing Testing"
    }
    
    var i = 0
    @IBAction func click() {
        textview.font = UIFont.preferredFont(forTextStyle: fontStyles[i])
        textfield.text = "\(i.description): \(textview.font!.pointSize)"
        i += 1
        if i == fontStyles.count {
            i = 0
        }
    }
}
