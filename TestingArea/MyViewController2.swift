import UIKit
import SwiftyUtils
import RxSwift
import CoreLocation
import AddressBookUI
import EZClockView
import CoreData
import TimeZoneLocate
import APTimeZones

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.text = "Testing Testing Testing"
        textview.text = APTimeZones.sharedInstance().timeZone(with: CLLocation(latitude: 0, longitude: 0)).description
    }
    
    func test1() {
        let rxText = textfield.rx.text
        rxText.debounce(0.5, scheduler: MainScheduler.instance).bind(to: textview.rx.text).disposed(by: disposeBag)
    }
    
    func test2() {
        textview.text = TimeZoneLocate.timeZone(location: CLLocation(latitude: 0, longitude: 0))?.description
    }
    
    @IBAction func click() {
        
    }
}
