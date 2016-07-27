import UIKit

class MyViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var picker: UIPickerView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1, 2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var suffix = ""
        
        switch component {
        case 0:
            suffix = " h"
        case 1:
            suffix = " m"
        case 2:
            suffix = " s"
        default:
            suffix = ""
        }
        
        return String(row) + suffix
    }
}
