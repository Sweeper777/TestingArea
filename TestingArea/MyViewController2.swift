import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
        
    @IBAction func click() {
        
    }
}
