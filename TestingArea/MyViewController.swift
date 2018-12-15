import UIKit
import Eureka

class MyViewController: FormViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ LatitudeSelectorRow(tag: "foo") {
            row in
            row.value = 30
        }
    }
}
