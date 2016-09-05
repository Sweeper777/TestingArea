import UIKit
import MapKit
import EZSwiftExtensions

class MyViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged), forControlEvents: .ValueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker){
        print("Hello")
    }
}
