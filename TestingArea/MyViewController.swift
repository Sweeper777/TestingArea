import UIKit
import MapKit
import EZSwiftExtensions

class MyViewController: UIViewController {
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        map.centerCoordinate = CLLocationCoordinate2DMake(25, 133)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(25, 133)
        map.addAnnotation(annotation)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}
