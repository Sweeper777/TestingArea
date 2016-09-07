import UIKit
import MapKit
import EZSwiftExtensions
import GoogleMaps

class MyViewController: UIViewController {
    override func viewDidLoad() {
        let camera = GMSCameraPosition.cameraWithLatitude(0, longitude: 0, zoom: 3)
        let mapView = GMSMapView.mapWithFrame(CGRect.zero, camera: camera)
        mapView.myLocationEnabled = true
        view = mapView
        let marker = GMSMarker(position: CLLocationCoordinate2DMake(0, 0))
        marker.snippet = "Hello World"
        marker.map = mapView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}
