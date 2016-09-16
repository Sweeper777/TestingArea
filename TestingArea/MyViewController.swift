import UIKit
import GoogleMaps

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("VC")
        vc.modalPresentationStyle = .Popover
        
        vc.popoverPresentationController!.sourceRect = CGRectMake(100, 100, 0, 0)
        vc.popoverPresentationController?.sourceView = self.view
        
        self.presentVC(vc)
    }
}
