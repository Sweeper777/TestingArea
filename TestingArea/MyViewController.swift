import UIKit
import EZSwiftExtensions
import Eureka

class MyViewController: UIViewController {
    
}


class TestVC1: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ StepperRow("stepper") {
            row in
            row.value = 1
            row.title = NSLocalizedString("Some Number", comment: "")
            row.cell.stepper.maximumValue = 10
            row.cell.stepper.minimumValue = 1
            row.cell.valueLabel.textColor = UIApplication.shared.keyWindow!.tintColor
        }
        
        for i in 1...10 {
            form +++ Section("section \(i)") {
                section in
                section.hidden = Condition.function(["stepper"]) {
                    let num: StepperRow = $0.rowBy(tag: "stepper")!
                    
                    if Int(num.value!) < i {
                        return true
                    }
                    return false
                }
            }
                <<< CustomRow(tag: "custom" + String(i)) {
                    row in
                    row.title = "Push!"
                    row.value = 1
                }
                <<< TextRow("text" + String(i)) {
                    row in
                    row.title = "Message:"
                    row.placeholder = "Blah"
                }.cellUpdate { cell, row in
                    cell.textField.textAlignment = .left
                }
        }

    }
}

        
    }
    
    override func viewDidLayoutSubviews() {
        
    }
}
