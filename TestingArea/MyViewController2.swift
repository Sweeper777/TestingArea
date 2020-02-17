import UIKit
import Alamofire
import HTMLReader
import WKWebViewCrawler

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    var html: String!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var request = URLRequest(url: URL(string: "xxx")!,timeoutInterval: Double.infinity)
        request.addValue("ASP.NET_SessionId=xxx", forHTTPHeaderField: "Cookie")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")

        request.httpMethod = "GET"
        
        Alamofire.request(request).responseString { (response) in
            guard case .success(let html) = response.result else { return }
            print("Done")
            self.html = html
        }
    }
    
    @IBAction func click() {
        let document = HTMLDocument(string: html)
        let nodes = document.nodes(matchingSelector: ".xxx")
        nodes.map { $0.textContent }.forEach { print($0) }
        nodes.map { $0.attributes["href"]! }.forEach { print($0) }
    }
}
