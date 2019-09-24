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
        
        test2()
        betterSC.indicatorViewBackgroundColor = UIColor.blue.darker()
        betterSC.cornerRadius = 20
        
        lunSC.dataSource = self
        
        betterSC.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(180)
            make.center.equalToSuperview()
        }
        
        lunSC.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(180)
            make.centerX.equalToSuperview()
            make.top.equalTo(betterSC.snp.bottom).offset(10)
        }
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
    
    func test2() {
        betterSC.segments = [
            LabelSegment(
                text: "None",
                numberOfLines: 0,
                normalTextColor: UIColor.blue.darker(),
                selectedTextColor: .white),
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
