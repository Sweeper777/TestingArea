import UIKit
import AVFoundation
import RxSwift
import Eureka

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var background1: UIView!
    @IBOutlet var groupedBackground1: UIView!
    @IBOutlet var fill1: UIView!
    @IBOutlet var label1: UILabel!
    @IBOutlet var background2: UIView!
    @IBOutlet var groupedBackground2: UIView!
    @IBOutlet var fill2: UIView!
    @IBOutlet var label2: UILabel!
    
    let disposeBag = DisposeBag()

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func click() {
        }
    }
}
