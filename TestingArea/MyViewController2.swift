import UIKit
import SwiftyUtils
import Contacts
import ContactsUI
import Alamofire

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var shadowView: UIView!

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 0
        shadowView.layer.opacity = 0.5
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    @IBAction func click() {
       
    }
    
    @IBAction func offsetX(_ sender: UISlider) {
        shadowView.layer.shadowOffset = CGSize(width: CGFloat(sender.value), height: shadowView.layer.shadowOffset.height)
    }
    
    @IBAction func offsetY(_ sender: UISlider) {
        shadowView.layer.shadowOffset = CGSize(width: shadowView.layer.shadowOffset.width, height: CGFloat(sender.value))
    }
    
    @IBAction func opacity(_ sender: UISlider) {
        shadowView.layer.shadowOpacity = sender.value
    }
    
    @IBAction func radius(_ sender: UISlider) {
        shadowView.layer.shadowRadius = CGFloat(sender.value)
    }
    
    @IBAction func useBoundsAsPath(_ sender: UISwitch) {
        shadowView.layer.shadowPath = sender.isOn ? UIBezierPath(rect: shadowView.bounds).cgPath : nil
    }
}
