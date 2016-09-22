import UIKit
import GoogleMaps
import TouchDraw

class MyViewController: UIViewController, GMSMapViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let panorama = GMSPanoramaView.panorama(withFrame: self.view.frame, nearCoordinate: CLLocationCoordinate2D(latitude: 22.287, longitude: 114.138))
        self.view = panorama
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: 22.287, longitude: 114.138))
        marker.panoramaView = self.view as! GMSPanoramaView
    }
}
