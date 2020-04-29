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
        
        let engine = DCTextEngine.withMarkdown()!
        engine.addPattern("<title> \\w+") { (regex, text) -> DCTextOptions? in
            let options = DCTextOptions()
            options.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            options.replaceText = String(text?.dropFirst(8) ?? "")
            return options
        }
        let attributedString = engine.parse("<title> abc\nhello")
        print(attributedString?.attribute(.font, at: 0, effectiveRange: nil) ?? "nil")
        textview.attributedText = attributedString
    }
    
    
    @IBAction func click() {
    }
    
    @available(*, unavailable)
    @objc func foo() {}
}
