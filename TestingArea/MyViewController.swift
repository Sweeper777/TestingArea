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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
