import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import CRCurrencyString
import MapKit
import CoreLocation
import PromiseKit

class MyViewController2: UIViewController, GIDSignInUIDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        locationManager.delegate = self
        test3()
        test4()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        textview.text = NSString.currencyString(withCentsAmount: 500, currencyCode: "HUF", andStyle: kCurrencyStyleNativeSymbol)
    }
    
    func test3() {
        let sourceLocation = CLLocationCoordinate2D(latitude: 40.759011, longitude: -73.984472)
        let destinationLocation = CLLocationCoordinate2D(latitude: 40.748441, longitude: -73.985564)
        
        // 3.
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 4.
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // 5.
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "Times Square"
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "Empire State Building"
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        // 6.
        self.map.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
        // 7.
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        // 8.
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.map.add((route.polyline), level: MKOverlayLevel.aboveRoads)
        }
    }
    
    func test4() {
        CLLocationManager.promise().catch {
            error in
            print(error)
            }.then {
                location -> Promise<CLLocation> in
                let alert = UIAlertController(title: location.description)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return CLLocationManager.promise()
            }.then { _ in
                print("done")
        }
    }
        
    @IBAction func click() {
        map.region.center = map.userLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
    }
    
    var flag = true
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if flag {
            mapView.region.center = userLocation.coordinate
            flag = false
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 4.0
        
        return renderer
    }
}
