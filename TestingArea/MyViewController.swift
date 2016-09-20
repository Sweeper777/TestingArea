import UIKit
import GoogleMaps
import TouchDraw

class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let map = GMSMapView()
        self.view = map
        map.settings.myLocationButton = true
        map.settings.setAllGesturesEnabled(true)
        map.settings.compassButton = true
        map.isMyLocationEnabled = true
        map.mapType = kGMSTypeHybrid
        map.camera = GMSCameraPosition(target: map.camera.target, zoom: 16, bearing: 0, viewingAngle: 65)
    }
}
