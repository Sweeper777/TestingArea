import UIKit
import WKWebViewCrawler

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let crawler = Client()
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "xxx")!
        let request = URLRequest(url: url)
        crawler.request(request) { _ in
            print("Done!")
        }
    }
    
    @IBAction func click() {
        crawler.filter(selector: ".xxx") { (element) in
            print(element ?? [])
        }
    }
}
