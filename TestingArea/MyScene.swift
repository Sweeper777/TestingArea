import SceneKit

class MyScene: SCNScene {
    @objc var cameraNode: SCNNode!
    @objc var box: SCNNode!
    @objc var ground: SCNNode!
    
    @objc func setup() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        
        self.rootNode.addChildNode(cameraNode)
        
        ground = SCNNode(geometry: SCNBox(width: 10, height: 1, length: 10, chamferRadius: 0))
        ground.position = SCNVector3(0, -1, 0)
        ground.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        
        box = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1))
        box.position = SCNVector3(0, 10, 0)
        box.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        box.physicsBody?.applyForce(SCNVector3(1, 0, 0), asImpulse: true)
        box.light = SCNLight()
        box.light?.type = .ambient
        self.rootNode.addChildNode(box)
        self.rootNode.addChildNode(ground)
    }
    
    @objc func executeCommand(_ command: String) {
        let parts = command.components(separatedBy: " ")
        let node: SCNNode
        guard let nodeString = parts.first else { return }
        switch nodeString {
        case "box": node = box
        case "ground": node = ground
        default: return
        }
        guard let selector = parts.dropFirst().first else { return }
        switch selector {
        case "applyForce":
            if parts.count == 8 {
                var x = Double(parts[2])!
                var y = Double(parts[3])!
                var z = Double(parts[4])!
                let direction = SCNVector3(x, y, z)
                x = Double(parts[5])!
                y = Double(parts[6])!
                z = Double(parts[7])!
                let point = SCNVector3(x, y, z)
                node.physicsBody?.applyForce(direction, at: point, asImpulse: true)
            } else if parts.count == 5 {
                let x = Double(parts[2])!
                let y = Double(parts[3])!
                let z = Double(parts[4])!
                let direction = SCNVector3(x, y, z)
                node.physicsBody?.applyForce(direction, asImpulse: true)
            }
        case "applyTorque":
            if parts.count == 6 {
                let x = Double(parts[2])!
                let y = Double(parts[3])!
                let z = Double(parts[4])!
                let w = Double(parts[5])!
                let direction = SCNVector4(x, y, z, w)
                node.physicsBody?.applyTorque(direction, asImpulse: true)
            }
        case "rotation":
            if parts.count == 6 {
                let x = Double(parts[2])!
                let y = Double(parts[3])!
                let z = Double(parts[4])!
                let w = Double(parts[5])!
                let direction = SCNVector4(x, y, z, w)
                node.rotation = direction
            }
        case "light":
            if parts.count == 3 {
                node.light?.type = SCNLight.LightType(rawValue: parts[2])
            }
        default: break
        }
    }
}
