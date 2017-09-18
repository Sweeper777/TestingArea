import UIKit
import SwiftyUtils
import RxSwift
import RealmSwift
import SwiftyAnimate
import NGORoundedButton
import JTImageButton

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var crosshair: CrossHair!
    @IBOutlet var ngoBtn: NGORoundedButton!
    @IBOutlet var jtButton: JTImageButton!
    
    @IBOutlet var image: UIImageView!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        ngoBtn.color = NGORoundedButtonColor.green
        ngoBtn.type = .customText
        ngoBtn.customImage = #imageLiteral(resourceName: "home")
        ngoBtn.customText = "Home"
        
        jtButton.borderWidth = 0
        jtButton.bgColor = UIColor(hex: "5abb5a")
        jtButton.titleColor = .white
        jtButton.iconColor = .white
        jtButton.createTitle("Home", withIcon: #imageLiteral(resourceName: "home"), font: nil, iconOffsetY: 0)
        jtButton.touchEffectEnabled = true
        jtButton.cornerRadius = jtButton.height / 2
        
        button.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        let attributed = NSAttributedString(string: "Button", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 7)])
        button.setAttributedTitle(attributed, for: .normal)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
        Animate(duration: 1.0) {
            self.view.backgroundColor = .green
            }.wait(timeout: 2, waitBlock: { $0() }).then(duration: 1.0) {
            self.view.backgroundColor = .white
        }.perform()
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
}
