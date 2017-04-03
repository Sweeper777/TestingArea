import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire

class MyViewController2: UIViewController {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    override func viewDidLoad() {
        
    }
    
    @IBAction func click() {
        Alamofire.request("https://api.fixer.io/\(textfield.text!)?base=HKD&symbols=GBP").responseString {
            response in
            if let error = response.error {
                self.textview.text = "An error occured: \(error.localizedDescription)"
                return
            }
            DispatchQueue.main.async {
                self.textview.text = response.result.value
            }
        }
    }
}
