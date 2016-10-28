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
    
    override func viewDidLayoutSubviews() {
        let radius = min(clock.w, clock.h) / 2
        clock.minuteHandLength = radius * 0.5
        clock.hourHandLength = radius * 0.3
        clock.secondHandLength = radius * 0.7
    }
}
