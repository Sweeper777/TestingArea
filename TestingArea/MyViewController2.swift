import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils
import Alamofire

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var datePicker: UIDatePicker!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    var rectangle = Rectangle(width: 1.0, length: 2.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.minimumDate = Date()
        self.datePicker.maximumDate = Calendar.current.date(byAdding: .hour, value: 24, to: Date())
//        var rectangle = Rect angle(width: 1.0, length: 2.0)
        let perimeter = add(p1: &rectangle.width, p2: &rectangle.length) * 2
        print(perimeter)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    @IBAction private func click() {
        
    }
}
struct Rectangle {
    var width: Float
    var length: Float
}
func add(p1: inout Float, p2: inout Float) -> Float {
    p1 *= 2
    p2 *= 2
    return p1 + p2
}
