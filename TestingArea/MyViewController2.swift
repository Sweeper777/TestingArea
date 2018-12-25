import UIKit
import SwiftyUtils
import UserNotifications

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func click() {
        UIView.animate(withDuration: 1, animations: {
            self.textview.transform = CGAffineTransform(scaleX: 2, y: 2)
        })
        DispatchQueue.main.async {
            let result = self.doSomeWork()
            print(result)
            UIView.animate(withDuration: 1, animations: {
                self.textfield.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
        }
    }
    
    func doSomeWork() -> Int {
        var count = 0
        for i in 0..<100000 {
            if "\(i)".reversed() == Array("\(i)") {
                count += 1
            }
        }
        return count
    }
}
