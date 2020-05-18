import UIKit
import Eureka
import SplitRow
import SCLAlertView

class MyViewController: FormViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section()
            <<< SplitRow<PickerInlineRow<String>,TextRow>(){
                $0.rowLeft = PickerInlineRow<String>(){
                    $0.title = "Choice 1"
                    $0.options = ["A","B","C"]
                    $0.value = "A"
                }

                $0.rowRight = TextRow(){
                    $0.title = "Hello"
                }
                
                $0.rowLeftPercentage = 0.5
                

            }
        
    }
}
