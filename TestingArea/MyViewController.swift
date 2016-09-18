import UIKit
import GoogleMaps

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VC")
        vc.modalPresentationStyle = .popover
        
        vc.popoverPresentationController!.sourceRect = CGRect(x: 100, y: 100, width: 0, height: 0)
        vc.popoverPresentationController?.sourceView = self.view
        
        self.presentVC(vc)
    }
}
