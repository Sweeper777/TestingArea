import UIKit
import Eureka

class MyTableViewController: FormViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ LabelRow() {
            row in
            row.cellStyle = .value1
            row.title = "Title"
            row.value = "Hello"
        }
    }
}
