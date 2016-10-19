import UIKit
import GoogleMaps
import TouchDraw

class MyViewController: UIViewController, GMSMapViewDelegate {
    var line: GMSPolyline!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let map = GMSMapView()
        self.view = map
        
        let path = GMSMutablePath()
        path.addLatitude(0, longitude: 0)
        path.addLatitude(20, longitude: 20)
        line = GMSPolyline(path: path)
        line.strokeColor = UIColor.red
        line.strokeWidth = 4
        line.map = map
        
        map.delegate = self
    }
    
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        if overlay == line {
            print("tapped overlay")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("tapped coordinate")
    }
}
