import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import MultiSlider

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var multiSlider: MultiSlider!
    
    override func viewDidLoad() {
        test1()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
        
    @IBAction func click() {
        
    }
    
    
}
