import UIKit
import SwiftyUtils
import SwiftyJSON
import Firebase
import WebKit

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var webView: WKWebView!

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        let html = """
<style>
div{
position:absolute;
padding: 0px;
text-alignment: center;
}
</style>
<div style="left:0%;top:20%;height:20%;width:50%;background:green;font-size:10vw;">
www.google.com
</div>
"""
        webView.loadHTMLString(html, baseURL: nil)
        webView.scrollView.isScrollEnabled = false
    }
    
    @IBAction func click() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
