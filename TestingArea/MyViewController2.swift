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
        config.backgoundTintColor = #colorLiteral(red: 0.4131736755, green: 0.7676505446, blue: 0.4273042679, alpha: 1)
        config.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
