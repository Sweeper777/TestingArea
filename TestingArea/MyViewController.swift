import UIKit
import EZSwiftExtensions
import TouchDraw

class MyViewController: UIViewController, TouchDrawViewDelegate {
    @IBOutlet var label: UILabel!
    @IBOutlet var draw: TouchDrawView!
    override func viewDidLoad() {
        draw.layer.borderWidth = 3
        draw.delegate = self
        draw.setWidth(3)
    }
    
    
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        draw.clearDrawing()
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
