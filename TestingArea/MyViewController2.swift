import UIKit
import SwiftyUtils
import RxSwift
import CoreLocation
import AddressBookUI

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
    }
    
    @IBAction func click() {
        print("started")
        geocoder.geocodeAddressString(textfield.text!, completionHandler: { (placemark, error) in
            print("completed")
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let loc = placemark?.first?.location {
                self.textview.text = "lat: \(loc.coordinate.latitude)\nlong: \(loc.coordinate.longitude)"
            } else {
                self.textview.text = "Cannot find place"
            }
        })
    }
    
    func test1() {
        print("started")
        geocoder.reverseGeocodeLocation(CLLocation(latitude: 20, longitude: -168), completionHandler: { (placemark, error) in
            print("completed")
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let place = placemark?.first {
                self.textview.text = ABCreateStringWithAddressDictionary(place.addressDictionary!, true)
            } else {
                self.textview.text = "Cannot find place"
            }
        })
    }
}
