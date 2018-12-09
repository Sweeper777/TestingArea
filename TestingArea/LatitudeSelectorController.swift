import UIKit
import Eureka
import CoreLocation

class LatitudeSelectorController: SelectorViewController<SelectorRow<PushSelectorCell<Double>>>, UIPickerViewDelegate, UIPickerViewDataSource {
    
    typealias RowValue = CLLocationDegrees
    
    
    @IBOutlet var latitudePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let latitude = row?.value {
            let (degrees, minutes, seconds) = decimalToDMS(latitude)
            
            latitudePicker.selectRow(abs(degrees), inComponent: 0, animated: false)
            latitudePicker.selectRow(minutes, inComponent: 1, animated: false)
            latitudePicker.selectRow(seconds, inComponent: 2, animated: false)
            latitudePicker.selectRow(degrees < 0 ? 1 : 0, inComponent: 3, animated: false)
        }
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 90
        case 1, 2:
            return 60
        case 3:
            return 2
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var suffix = ""
        
        switch component {
        case 0:
            suffix = "°"
        case 1:
            suffix = "'"
        case 2:
            suffix = "\""
        default:
            suffix = ""
        }
        
        if component == 3 {
            if row == 0 {
                return "N"
            } else {
                return "S"
            }
        }
        
        return String(row) + suffix
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let degrees = latitudePicker.selectedRow(inComponent: 0)
        let minutes = latitudePicker.selectedRow(inComponent: 1)
        let seconds = latitudePicker.selectedRow(inComponent: 2)
        let negative = latitudePicker.selectedRow(inComponent: 3) == 1
        self.row?.value = (Double(degrees) + Double(minutes) / 60.0 + Double(seconds) / 3600.0) * (negative ? -1 : 1)
    }
    
}

func decimalToDMS(_ decimal: CLLocationDegrees) -> (degrees: Int, minutes: Int, seconds: Int) {
    var seconds = Int(round(decimal * 3600))
    let degrees: Int = seconds / 3600
    seconds = abs(seconds % 3600)
    let minutes: Int = seconds / 60
    seconds %= 60
    return (degrees, minutes, seconds)
}
