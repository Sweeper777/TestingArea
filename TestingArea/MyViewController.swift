import UIKit

class MyViewController: UIViewController{
    @IBOutlet var gameView: GameView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.gameObjects.append(Line(position: CGPoint(x: 0, y: 0.5), velocity: (0, 0), zIndex: 0, length: 0.1, horizontal: true, color: UIColor.green))
        gameView.gameObjects.append(Line(position: CGPoint(x: 0.1, y: 0.5), velocity: (0, 0), zIndex: 0, length: 0.4, horizontal: true, color: UIColor.black))
        gameView.gameObjects.append(Line(position: CGPoint(x: 0.5, y: 0.55), velocity: (0, 0), zIndex: 0, length: 0.5, horizontal: true, color: UIColor.black))
        gameView.gameObjects.append(Dot(position: CGPoint(x: 0.1, y: 0.5), zIndex: 1))
        gameView.gameObjects.append(AndGate(position: CGPoint(x: 0.5, y: 0.55), velocity: (0, 0), zIndex: 2))
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
}
