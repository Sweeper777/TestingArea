import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import CRCurrencyString

class MyViewController2: FormViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        textview.text = NSString.currencyString(withCentsAmount: 500, currencyCode: "HUF", andStyle: kCurrencyStyleNativeSymbol)
    }
        
    @IBAction func click() {
        
    }
    
    
}
