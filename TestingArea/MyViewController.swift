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
    }
}
