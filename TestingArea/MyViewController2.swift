import UIKit
import DCTextEngine

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
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "home")?.withTintColor(.link)

        let fullString = NSMutableAttributedString(string: "1: Press the ")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: " button"))
        textview.attributedText = fullString

    }
    
    
    @IBAction func click() {
        let imageAttachment = NSTextAttachment(image: UIImage(named: "home")!)

        let fullString = NSMutableAttributedString(string: "2: Press the ")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: " button"))
        textview.attributedText = fullString
    }
    
    @available(*, unavailable)
    @objc func foo() {}
}
