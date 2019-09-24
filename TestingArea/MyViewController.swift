import UIKit
import SnapKit
import BetterSegmentedControl
import LUNSegmentedControl

class MyViewController: UIViewController{
    @IBOutlet var blur: UIVisualEffectView!
    
    @IBOutlet var betterSC: BetterSegmentedControl!
    @IBOutlet var lunSC: LUNSegmentedControl!
    
    override func viewDidLoad() {
        blur.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        betterSC.indicatorViewBackgroundColor = UIColor.blue.darker()
        betterSC.cornerRadius = 20
            make.center.equalToSuperview()
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
