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

class TestVC2: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ SwitchRow("switch1") {
            row in
            row.title = "Switch me on!"
            row.value = false
        }
            <<< SwitchRow("switch2") {
                row in
                row.title = "Switch me on!"
                row.value = false
        }
        
        form +++ StepperRow("stepper") {
            row in
            row.value = 1
            row.title = NSLocalizedString("Some Number", comment: "")
            row.cell.stepper.maximumValue = 10
            row.cell.stepper.minimumValue = 1
            row.cell.valueLabel.textColor = UIApplication.shared.keyWindow!.tintColor
            
            row.hidden = Condition.function(["switch1", "switch2"]) {
                let switchRow1: SwitchRow = $0.rowBy(tag: "switch1")!
                let switchRow2: SwitchRow = $0.rowBy(tag: "switch2")!
                
                if (switchRow1.value ?? true) && (switchRow2.value ?? true) {
                    return false
                }
                return true
            }
        }
        
        for i in 1...10 {
            form +++ Section("section \(i)") {
                section in
                section.hidden = Condition.function(["stepper", "switch1", "switch2"]) {
                    let num: StepperRow = $0.rowBy(tag: "stepper")!
                    let switchRow1: SwitchRow = $0.rowBy(tag: "switch1")!
                    let switchRow2: SwitchRow = $0.rowBy(tag: "switch2")!
                    
                    
                    if Int(num.value!) < i || !((switchRow1.value ?? true) && (switchRow2.value ?? true)) {
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

class TestVC3: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ TextAreaRow() <<< TextAreaRow() <<< TextAreaRow()
        
        form +++ SwitchRow("switch1") {
            row in
            row.title = "Switch me on!"
            row.value = false
            }
            <<< SwitchRow("switch2") {
                row in
                row.title = "Switch me on!"
                row.value = false
        }
        
        form +++ StepperRow("stepper") {
            row in
            row.value = 1
            row.title = NSLocalizedString("Some Number", comment: "")
            row.cell.stepper.maximumValue = 10
            row.cell.stepper.minimumValue = 1
            row.cell.valueLabel.textColor = UIApplication.shared.keyWindow!.tintColor
            
            row.hidden = Condition.function(["switch1", "switch2"]) {
                let switchRow1: SwitchRow = $0.rowBy(tag: "switch1")!
                let switchRow2: SwitchRow = $0.rowBy(tag: "switch2")!
                
                if (switchRow1.value ?? true) && (switchRow2.value ?? true) {
                    return false
                }
                return true
            }
        }
        
        for i in 1...10 {
            form +++ Section("section \(i)") {
                section in
                section.hidden = Condition.function(["stepper", "switch1", "switch2"]) {
                    let num: StepperRow = $0.rowBy(tag: "stepper")!
                    let switchRow1: SwitchRow = $0.rowBy(tag: "switch1")!
                    let switchRow2: SwitchRow = $0.rowBy(tag: "switch2")!
                    
                    
                    if Int(num.value!) < i || !((switchRow1.value ?? true) && (switchRow2.value ?? true)) {
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
