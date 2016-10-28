import UIKit
import EZSwiftExtensions
import BEMAnalogClock

class MyViewController: UIViewController {
    @IBOutlet var clock: BEMAnalogClockView!
    
    override func viewDidLoad() {
        clock.realTime = true
        clock.setClockToCurrentTime(animated: false)
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print(clock.seconds)
    }
}
