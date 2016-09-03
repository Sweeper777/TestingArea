import UIKit
import AVFoundation
import EZSwiftExtensions
import Eureka

class MyViewController2: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
            form +++ SegmentedRow<String>(nil) {
                row in
                row.title = "test"
                row.options = ["1", "2", "3"]
                row.value = "1"
        }
            <<< PickerInlineRow<String>(nil) {
                row in
                row.title = "test"
                row.options = ["1", "2", "3"]
                row.value = "1"
        }
        
        let alert = UIAlertController(title: "", message: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "x", style: .Default, handler: nil))
        alert.addAction(UIAlertAction(title: "x", style: .Default, handler: nil))
        alert.addAction(UIAlertAction(title: "x", style: .Default, handler: nil))

        
        self.presentVC(alert)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        print(form.rows[0].baseCell.frame.height)
        print(form.rows[1].baseCell.frame.height)
    }
}
