import UIKit
import RxSwift
import RxCocoa
import CLTokenInputView
import SwiftyUtils

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    var tokenView: CLTokenInputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.main.scale)
        tokenView = CLTokenInputView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        view.addSubview(tokenView)
        tokenView.translatesAutoresizingMaskIntoConstraints = false
        tokenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tokenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tokenView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tokenView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        tokenView.delegate = self
        tokenView.layer.borderWidth = 1
        tokenView.layer.borderColor = UIColor.black.cgColor
        Bundle.main.appBuild
    }
    
    @IBAction private func click() {
//        test2()
    }
}

extension MyViewController2 : CLTokenInputViewDelegate {
    func tokenInputView(_ view: CLTokenInputView, didChangeText text: String?) {
        if text?.hasSuffix(" ") ?? false {
            view.add(CLToken(displayText: String(text!.dropLast()), context: nil))
        }
    }
}
