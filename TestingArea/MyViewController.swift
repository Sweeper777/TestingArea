import UIKit
import EZSwiftExtensions
import Eureka
import PinYin4Objc

class MyViewController: FormViewController {
    override func viewDidLoad() {
        title = NSLocalizedString("Global Settings", comment: "")
        initializeForm()
    }
    
    func initializeForm() {
        form +++ Section(footer: NSLocalizedString("gesture instructions", comment: ""))
            <<< SwitchRow("gestureControls") {
                row in
                row.title = NSLocalizedString("Gesture Controls", comment: "")
                row.value = NSUserDefaults.standardUserDefaults().boolForKey("gestureControl")
            }
            
            +++ SegmentedRow<String>("fontStyle") {
                row in
                row.title = NSLocalizedString("Font Style", comment: "")
                row.options = ["Light", "Regular"]
                row.value = NSUserDefaults.standardUserDefaults().integerForKey("fontStyle") == 1 ? "Regular" : "Light"
            }
        let string = "library"
        let mutableString = NSMutableString(string: string)
        print(CFStringTransform(mutableString, nil, kCFStringTransformLatinKatakana, false))
        print(mutableString)
    }
}
