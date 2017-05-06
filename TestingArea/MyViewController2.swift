import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import Eureka
import FirebaseAuth
import GoogleSignIn

public struct MyOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let one = MyOptions(rawValue: 1 << 0)
    public static let two = MyOptions(rawValue: 1 << 1)
}

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        test1()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func click() {
        GIDSignIn.sharedInstance().signOut()
        try? FIRAuth.auth()?.signOut()
    }
}
