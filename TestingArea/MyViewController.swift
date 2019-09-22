import UIKit
import SnapKit

class MyViewController: UIViewController{
    @IBOutlet var blur: UIVisualEffectView!
    @IBOutlet var text: UITextView!
    
    override func viewDidLoad() {
        blur.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        text.snp.makeConstraints { (make) in
            make.width.equalTo(240)
            make.height.equalTo(128)
            make.center.equalToSuperview()
        }
    }
}
