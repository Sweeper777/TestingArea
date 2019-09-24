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
    
    func test1() {
        betterSC.segments = [
            IconSegment(
                icon: UIImage(named: "home")!,
                iconSize: CGSize(width: 25, height: 25),
                normalIconTintColor: UIColor.blue.darker(),
                selectedIconTintColor: .white),
            IconSegment(
                icon: UIImage(named: "settings")!,
                iconSize: CGSize(width: 25, height: 25),
                normalIconTintColor: UIColor.blue.darker(),
                selectedIconTintColor: .white),
            IconSegment(
                icon: UIImage(named: "icons8-repeat_filled")!,
                iconSize: CGSize(width: 25, height: 25),
                normalIconTintColor: UIColor.blue.darker(),
                selectedIconTintColor: .white),
        ]
    }
    
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
