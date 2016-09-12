import UIKit
import Eureka

public struct Time: Equatable {
    var hours: Int
    var minutes: Int
    var seconds: Int
}

public func ==(lhs: Time, rhs: Time) -> Bool {
    return lhs.hours == rhs.hours && lhs.minutes == rhs.minutes && lhs.seconds == rhs.seconds
}

public class TimeIntervalCell: PickerCell<Time> {

    public required init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public override func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }

    public override func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 100
        default:
            return 60
        }
    }

    public override func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) h"
        case 1:
            return "\(row) m"
        default:
            return "\(row) s"
        }
    }

    public override func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let pickerRow = self.row as? TimeIntervalRow {
            var time = pickerRow.value
            switch component {
            case 0:
                time?.hours = row
            case 1:
                time?.minutes = row
            default:
                time?.seconds = row
            }
            pickerRow.value = time
        }
    }
}

public final class TimeIntervalRow: Row<Time, TimeIntervalCell>, RowType {

    required public init(tag: String?) {
        super.init(tag: tag)
        value = Time(hours: 0, minutes: 0, seconds: 0)
    }
}