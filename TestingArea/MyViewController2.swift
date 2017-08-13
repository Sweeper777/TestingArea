import UIKit
import SwiftyUtils
import RxSwift
import CoreLocation
import TimeZoneLocate

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    let geocoder = CLGeocoder()
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.text = "Testing Testing Testing"
        textfield.rx.observe(String.self, "text").subscribe(onNext: { s in
            print(s ?? "nil")
        }).disposed(by: disposeBag)
    }
    
    @IBAction func click() {
        
        textfield.text = TimeZoneLocate.timeZone(location: CLLocation(latitude: 0, longitude: 0))?.identifier
    }
}

