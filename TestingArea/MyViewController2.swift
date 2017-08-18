import UIKit
import SwiftyUtils
import RxSwift

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var webview: UIWebView!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        let html = try! String.init(contentsOf: URL(string: "https://motherfuckingwebsite.com")!) +  "<style>body { background: red !important; }<style/>Hello"
        webview.loadHTMLString(html, baseURL: nil)
//        let styles = "<style>body { background: red !important; }<style/>Hello"
//        webview.loadHTMLString(styles, baseURL: URL(string: "https://motherfuckingwebsite.com"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
    }
}
