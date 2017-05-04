import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import Eureka
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        ref = FIRDatabase.database().reference()
        test8()
        test5()
    }

    func test1() {
        ref.observeSingleEvent(of: .value, with: {
            snapshot in
            self.textview.text = (snapshot.value! as! [String: Any])["name"] as! String
        })
    }
    
    func test2() {
        ref.child("name").setValue("Hello")
    }
    
    func test3() {
        var json = JSON(dictionaryLiteral: ("name", "My Quiz"), ("questions", [Any]()))
        json["questions"] = [["text": "", "type": "", "answer": "", "hint": ""]]
        json["questions"][0]["text"] = "What is your name?"
        json["questions"][0]["type"] = "fib"
        json["questions"][0]["answer"] = "Mulang"
        json["questions"][0]["hint"] = "Begins with an 'M'"
        ref.child("question").setValue(json.dictionaryObject)
    }
    
    func test4() {
        ref.observeSingleEvent(of: .childChanged, with: { _ in
            print("data changed")
        })
    }
    
    func test5() {
        ref.child("question").observeSingleEvent(of: .value, with: {
            snapshot in
            let json = JSON(snapshot.value!)
            print(json)
        })
    }
    
    func test6() {
        FIRAuth.auth()?.createUser(withEmail: testEmail, password: testPassword, completion: { (user, error) in
            print(error != nil ? error.debugDescription : "User has been created")
        })
    }
    
    func test7() {
        FIRAuth.auth()?.signIn(withEmail: testEmail, password: testPassword, completion: { (user, error) in
            print(error != nil ? error.debugDescription : "User logged in")
        })
    }
    
    func test8() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func click() {
        
    }
}
