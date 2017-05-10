import UIKit
import Eureka

class MyTableViewController: FormViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ MultiSelectSegmentedRow("Hi") {
            row in
            row.title = "Answers"
            row.value = NSMutableArray(array: ["A", "D"])
            }.onChange {
                row in
                print(row.value!)
        }
    }
}
