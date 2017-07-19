import UIKit
import SwiftyUtils
import RxSwift
import CoreLocation
import AddressBookUI
import EZClockView

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
        
        let clock = EZClockView(frame: view.bounds)
        
        // Setup time
        clock.hours = 7
        clock.minutes = 12
        clock.seconds = 47
        
        // Customize face with border thickness and background color
        clock.faceBorderWidth = 3
        clock.faceBackgroundColor = UIColor(white: 0.9, alpha: 1)
        
        // Set the thickness of any needle
        clock.hoursThickness = 5
        
        // Set the length of any needle (1 means the needle is as long as the face radius)
        clock.minutesLength = 0.5
        
        // Offset is how far beyond the center the needle can go back.
        clock.secondsOffset = 5
        
        // You can customize several markings properties
        clock.markingBorderSpacing = 5
        clock.markingHourLength = 10
        clock.markingMinuteLength = 5
        clock.markingHourThickness = 3
        
        clock.markingMinuteColor = UIColor.darkGray
        
        view.addSubview(clock)
    }
    
    @IBAction func click() {
        
    }
}
