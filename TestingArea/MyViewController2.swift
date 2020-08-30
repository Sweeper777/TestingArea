import UIKit
import RxSwift
import RxCocoa
import SCLAlertView
import SwiftyJSON
import Alamofire

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    var v: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = UIBarButtonItem(title: "Hiiiii", style: .plain, target: nil, action: nil)
        x.setTitleTextAttributes([.font: UIFont.monospacedSystemFont(ofSize: 17, weight: .regular)], for: .normal)
        x.setTitleTextAttributes([.font: UIFont.monospacedSystemFont(ofSize: 17, weight: .regular)], for: .highlighted)
        navigationItem.rightBarButtonItem = x
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("changed")
    }
    
    @IBAction private func click() {
        
    }
}
