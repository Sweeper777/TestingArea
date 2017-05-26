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
    
    func test2() {
    }
    
    func test4() {
    }
    
    func test6() {
    }
    
    @IBAction func click() {
        
    }
    
//        textview.text = "A: \(slider.value[4])\nB: \(slider.value[3])\nC: \(slider.value[2])\nD: \(slider.value[1])\nE: \(slider.value[0])\n"
    }
}
