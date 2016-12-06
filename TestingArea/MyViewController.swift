import UIKit
import EZSwiftExtensions
import MessageUI
import CoreData

class MyViewController: UIViewController, MFMailComposeViewControllerDelegate {
    override func viewDidLoad() {
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
}


extension Date {
    func isTheSameDayAs(other: Date) -> Bool {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: other)
        components.hour = 00
        components.minute = 00
        components.second = 00
        let startDate = calendar.date(from: components)!
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar.date(from: components)!
        
        return (startDate.compare(self) == .orderedAscending || startDate.compare(self) == .orderedSame) && (endDate.compare(self) == .orderedDescending || endDate.compare(self) == .orderedSame)
    }
}
