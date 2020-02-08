import UIKit
import AVFoundation
import RxSwift
import Eureka
import BigNumber
import Alamofire

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = Calendar.current
        let start = Date(timeIntervalSince1970: 1577375330)
        let end = Date(timeIntervalSince1970: 1577893730)
        let startDateComponents = calendar.dateComponents([.weekOfYear], from: start)
        let endDateComponents = calendar.dateComponents([.weekOfYear], from: end)
        let interval = calendar.dateComponents([.weekOfYear], from: startDateComponents, to: endDateComponents).weekOfYear!
        print(interval)
        
    }
    
    @IBAction func click() {
        
    }
}
