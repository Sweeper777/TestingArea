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
        config.backgoundTintColor = UIColor(white: 0.97, alpha: 1)
        config.borderColor = UIColor.white
        config.menuWidth = 150
        config.menuSeparatorColor = UIColor.lightGray
        config.textAlignment = .left
        config.textFont = UIFont.systemFont(ofSize: 16)
        config.menuRowHeight = 50
        config.cornerRadius = 20
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
