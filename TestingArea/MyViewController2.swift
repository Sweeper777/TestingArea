import UIKit
import RxSwift
import RxCocoa
import EventKit

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
        }
    }
    
    
    @IBAction func click() {
        var components = DateComponents()
        components.year = 2020
        components.month = 6
        components.day = 27
        components.hour = 9
        let eventStore : EKEventStore = EKEventStore()

        // 'EKEntityTypeReminder' or 'EKEntityTypeEvent'
        

        eventStore.requestAccess(to: .event) { (granted, error) in

            if (granted) && (error == nil) {

//                let event:EKEvent = EKEvent(eventStore: eventStore)
//
//                event.title = "Test Title"
//                let date = Calendar.current.date(from: components)!
//                event.startDate = date
//                event.endDate = date
//                event.isAllDay = true
//                event.notes = "This is a note"
//                event.calendar = eventStore.calendar
//                event.alarms = [EKAlarm(relativeOffset: -86400 + 9 * 3600), EKAlarm(relativeOffset: -86400 * 2 + 9 * 3600)]
                do {
//                    try eventStore.save(event, span: .thisEvent)
                    let calendar = EKCalendar(for: .event, eventStore: eventStore)
                    calendar.title = "Test Calendar"
                    calendar.source = eventStore.sources.first(where: { $0.sourceType == .local })
                    try eventStore.saveCalendar(calendar, commit: true)
                } catch let error as NSError {
                    print("failed to save event with error : \(error)")
                }
                print("Saved Event")
            }
        }
    }
}
