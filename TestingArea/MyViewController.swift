import UIKit
import ARKit
import SceneKit

class MyViewController: UIViewController{
    var sceneView: ARSCNView {
        return self.view as! ARSCNView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene(named: "test.scn")!
        sceneView.scene = scene
        sceneView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        sceneView.delegate = self
    }
}
