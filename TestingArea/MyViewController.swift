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
        clock.minuteHandLength = clock.hubRadius * 1.5
        clock.hourHandLength = clock.hubRadius * 1
        clock.secondHandLength = clock.hubRadius * 2
    }
}
