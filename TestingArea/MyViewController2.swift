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
        let config = FTConfiguration.shared
        config.textColor = UIColor.black
        config.backgoundTintColor = UIColor.white
        config.borderColor = UIColor.lightGray
        config.menuSeparatorColor = UIColor.lightGray
        config.textAlignment = .center
        config.textFont = UIFont.systemFont(ofSize: 14)
        config.menuRowHeight = 40
        config.cornerRadius = 6
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
