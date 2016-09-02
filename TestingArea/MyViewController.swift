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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let formatter = NSDateFormatter()
        
        let date = NSDate()
        
        formatter.timeStyle = .ShortStyle
        formatter.dateStyle = .NoStyle
        
        label.text = formatter.stringFromDate(date)
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
