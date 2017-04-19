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

@IBDesignable
class RoundedImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        super.layer.cornerRadius = super.frame.size.height / 2
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layer.cornerRadius = super.frame.size.height / 2
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        super.layer.cornerRadius = super.frame.size.height / 2
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        layer.cornerRadius = self.frame.size.height / 2
    }
    
    override func layoutSubviews() {
        super.layer.cornerRadius = super.frame.size.height / 2
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
