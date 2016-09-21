import UIKit
import GoogleMaps
import TouchDraw

class MyViewController: UIViewController, GMSMapViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let map = GMSMapView()
        self.view = map
        map.settings.myLocationButton = true
        map.settings.setAllGesturesEnabled(true)
        map.settings.compassButton = true
        map.isMyLocationEnabled = true
        map.mapType = kGMSTypeSatellite
        map.camera = GMSCameraPosition(target: map.camera.target, zoom: 16, bearing: 0, viewingAngle: 65)
        let marker = GMSMarker(position: map.camera.target)
        marker.isFlat = false
        marker.rotation = 90
        marker.map = map
    }
}
