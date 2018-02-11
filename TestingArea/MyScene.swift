import SceneKit

class MyScene: SCNScene {
    var cameraNode: SCNNode!
    func setup() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        
        self.rootNode.addChildNode(cameraNode)
        
        let ground = SCNNode(geometry: SCNBox(width: 10, height: 1, length: 10, chamferRadius: 0))
        ground.position = SCNVector3(0, -1, 0)
        ground.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        
    }
}
