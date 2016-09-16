import UIKit
import GoogleMaps

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.cameraWithLatitude(0, longitude: 0, zoom: 3)
        let mapView = GMSMapView.mapWithFrame(CGRect.zero, camera: camera)
        mapView.myLocationEnabled = true
        view = mapView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("VC")
        vc.modalInPopover = true
        vc.modalPresentationStyle = .Popover
        
        vc.popoverPresentationController!.sourceRect = CGRectMake(100, 100, 0, 0)
        vc.popoverPresentationController?.sourceView = self.view
        
        self.presentVC(vc)
    }
}
