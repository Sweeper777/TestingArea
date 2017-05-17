import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import Eureka
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
        test2()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        multiSlider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    func test3() {
        multiSlider.thumbImage = #imageLiteral(resourceName: "thumb")
    }
    @IBAction func click() {
        
    }
    
    func valueChanged(_ slider: MultiSlider) {
//        textview.text = "A: \(slider.value[4])\nB: \(slider.value[3])\nC: \(slider.value[2])\nD: \(slider.value[1])\nE: \(slider.value[0])\n"
    }
}
