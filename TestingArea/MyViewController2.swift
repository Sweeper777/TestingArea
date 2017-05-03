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

    func test1() {
        ref.observeSingleEvent(of: .value, with: {
            snapshot in
            self.textview.text = (snapshot.value! as! [String: Any])["name"] as! String
        })
    }
    func test5() {
        ref.child("question").observeSingleEvent(of: .value, with: {
            snapshot in
            let json = JSON(snapshot.value!)
            print(json)
        })
    }
    
    @IBAction func click() {
        
    }
}
