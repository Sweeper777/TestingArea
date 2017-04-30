import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import Eureka
import FirebaseDatabase


class MyViewController2: UIViewController {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        ref = FIRDatabase.database().reference()
    }
    
    @IBAction func click() {
        
    }
}
