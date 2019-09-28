import UIKit
import MediaPlayer
import RxSwift

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    
    let synthesiser = AVSpeechSynthesizer()
    let disposeBag = DisposeBag()

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        synthesiser.delegate = self
        textview.attributedText = NSAttributedString(string: textview.text, attributes: [.font: UIFont.systemFont(ofSize: 19)])
    }
    
    @IBAction func click() {
//        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//            .take(30).map { String($0) }
//            .bind(to: label.rx.text)
//            .disposed(by: disposeBag)
    }
    
}

extension MyViewController2 : AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let attributedString = NSMutableAttributedString(attributedString: textview.attributedText)
        attributedString.removeAttribute(NSAttributedString.Key.backgroundColor, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.yellow, range: characterRange)
        textview.attributedText = attributedString
        textview.scrollRangeToVisible(characterRange)
    }
}
