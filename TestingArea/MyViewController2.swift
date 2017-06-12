import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import CRCurrencyString
import MapKit
import CoreLocation

class MyViewController2: UIViewController, GIDSignInUIDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        textview.text = NSString.currencyString(withCentsAmount: 500, currencyCode: "HUF", andStyle: kCurrencyStyleNativeSymbol)
    }
        
    @IBAction func click() {
        
    }
    
    
}
