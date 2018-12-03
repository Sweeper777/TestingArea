import UIKit
import SwiftyUtils
import UserNotifications

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField! {
        didSet {
            print("XXXXXXXXXX \(textfield)")
        }
    }
    @IBOutlet var button: UIButton!
    @IBOutlet var barChart: BarChartView!
    
    let center = UNUserNotificationCenter.current()
    
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.percentages = [
            (0.5, 0.7, 0.6, 0.3),
            (1.0, 0.3, 0.6, 0.8),
            (1.0, 0.5, 0.7, 0.3),
            (0.8, 0.5, 0.5, 0.9),
            (0.9, 0.3, 0.4, 0.5),
            (1.0, 0.4, 0.5, 0.6),
            (0.5, 0.9, 0.8, 0.7)
        ]
    }
    
    @IBAction func click() {
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                print("Notification not authorised")
            } else {
                if #available(iOS 12.0, *) {
                    let content = UNMutableNotificationContent()
                    content.title = "Test Title"
                    content.subtitle = "Test Subtitle"
                    content.body = "Test Body"
                    content.sound = UNNotificationSound.defaultCritical
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                    let request = UNNotificationRequest(identifier: "Test Notification", content: content, trigger: trigger)
                    self.center.add(request, withCompletionHandler: { (error) in
                        if let e = error {
                            print(e.localizedDescription)
                        }
                    })
                } else {
                    // Fallback on earlier versions
                }

                
            }
        }
    }
}
