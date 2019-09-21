import UIKit
import MediaPlayer

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let synthesiser = AVSpeechSynthesizer()

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.attributedText = NSAttributedString(string: textview.text, attributes: [.font: UIFont.systemFont(ofSize: 19)])
    }
    
    @IBAction func click() {
        test2()
    }
    
    func test1() {
        let start = textview.attributedText.string.count - 2
        let range = NSRange(location: start, length: 1)
        textview.scrollRangeToVisible(range)
    }
    
    
    var i = 0
    func test2() {
        _ = Timer.every(0.2) { (timer) in
            self.textview.attributedText = attributedString
            self.textview.scrollRangeToVisible(range)
            if self.i + 1 >= self.textview.attributedText.string.count {
                timer.invalidate()
            }
        }
    }
}
