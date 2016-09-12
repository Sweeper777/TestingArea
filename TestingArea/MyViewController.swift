import UIKit
import Eureka

class MyViewController: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ TimeIntervalRow(nil) {
            row in
            row.title = "Time Interval"
            row.value = Time(hours: 0, minutes: 0, seconds: 10)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}
