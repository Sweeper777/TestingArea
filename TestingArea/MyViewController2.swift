import UIKit
import AVFoundation
import DoneToolbarSwift
import EZSwiftExtensions

class MyViewController2: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBAction func item(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let flags: NSCalendarUnit = [.Day, .Year, .Month]
        let date = NSDate()
        let components = NSCalendar.currentCalendar().components(flags, fromDate: date)
        let wrong = NSCalendar.currentCalendar().dateFromComponents(components)
        print(wrong!)
        components.timeZone = NSTimeZone(name: "GMT")
        let correct = NSCalendar.currentCalendar().dateFromComponents(components)
        print(correct!)
    }
}
