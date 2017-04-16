import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift

class MyViewController2: UIViewController {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    override func viewDidLoad() {
        
    }
    
    @IBAction func click() {
        FTPopOverMenu.showForSender(sender: button, with: [
                "Item 1", "Item2", "Item 3", "Item 4"
            ], menuImageArray: [
                "settings", "home", "settings", "home"
            ], done: { index in
                print(index)
        }, cancel: {})
    }
}
