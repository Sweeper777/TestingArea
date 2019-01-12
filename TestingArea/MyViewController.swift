import UIKit
import ARKit
import SceneKit

class MyViewController: UIViewController{
    var sceneView: ARSCNView {
        return self.view as! ARSCNView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ LatitudeSelectorRow(tag: "foo") {
            row in
            row.value = 30
        }
    }
}
