import UIKit
import EZSwiftExtensions
import TouchDraw

class MyViewController: UIViewController, TouchDrawViewDelegate {
    @IBOutlet var draw: TouchDrawView!
    @IBOutlet var image: UIImageView!
    override func viewDidLoad() {
        draw.layer.borderWidth = 3
        draw.delegate = self
        draw.setWidth(3)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        let stack = draw.exportStack()
        let data = NSKeyedArchiver.archivedDataWithRootObject(stack)
        print(data.length)
    }
    
    func undoEnabled() {
        
    }
    
    func undoDisabled() {
        
    }
    
    func redoEnabled() {
        
    }
    
    func redoDisabled() {
        
    }
    
    func clearEnabled() {
        
    }
    
    func clearDisabled() {
        
    }
}
