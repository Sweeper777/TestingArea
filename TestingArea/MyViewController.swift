
import UIKit
import SpriteKit

class MyViewController: UIViewController {
    @IBOutlet var twoCirlcesView: TwoCirclesView!
    
    var displayLink: CADisplayLink?
    
    override func viewDidLoad() {
//        twoCirlcesView.roll = false
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        displayLink?.invalidate()
        displayLink = CADisplayLink(target: twoCirlcesView!, selector: #selector(twoCirlcesView.update))
        displayLink?.add(to: .main, forMode: .common)
    }
}
