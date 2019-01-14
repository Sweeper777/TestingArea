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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        sceneView.session.run(config)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sceneView.session.pause()
    }
}

extension MyViewController : ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let planeAnchor = anchor as! ARPlaneAnchor
        let box = SCNBox(width: CGFloat(planeAnchor.extent.x), height: 0.01, length: CGFloat(planeAnchor.extent.z), chamferRadius: 0)
        return SCNNode(geometry: box)
    }
}
