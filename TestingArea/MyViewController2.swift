import UIKit
import SwiftyUtils
import SnapKit
import SwiftyJSON

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func click() {
    }
    
    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        if view.bounds.width < view.bounds.height {
            return UITraitCollection(horizontalSizeClass: .compact)
        } else {
            return UITraitCollection(horizontalSizeClass: .regular)
        }
    }
}

protocol TimerModelDelegate : class {
    func timerTextDidChange(_ time: TimerModel, text: String)
}

class TimerModel: NSObject {
    var myTimer: Timer? = Timer()
    var timerInterval: TimeInterval = 1.0
    var timerEnd: TimeInterval = 0.0
    var timerCount: TimeInterval = 86400.0 // 24 hours
    weak var delegate: TimerModelDelegate?
    var timerStr: String = "TIME" {
        didSet {
            delegate?.timerTextDidChange(self, text: timerStr)
        }
    }
    
    func StartTimer(time: Double) {
        timerCount = time
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
    }
    
    @objc func UpdateTime() {
        self.timerCount-=1
        self.timerStr = self.TimerDate(time: self.timerCount)
        print(self.timerStr)
    }
    
    func TimerDate(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}
