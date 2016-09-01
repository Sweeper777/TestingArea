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
        formatter.dateFormat = "hh:mm"
    }
    
    let formatter = NSDateFormatter()
    
    var timer: NSTimer?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let date = NSDate()
        label.text = formatter.stringFromDate(date)
        let secondsUntilMinute = 60 - NSCalendar.currentCalendar().component(.Second, fromDate: date)
        if secondsUntilMinute != 0 {
            NSTimer.runThisAfterDelay(seconds: Double(secondsUntilMinute)) {
                [weak self] in
                let date = NSDate()
                self?.label.text = self?.formatter.stringFromDate(date)
                if let myself = self {
                    myself.timer = NSTimer.runThisEvery(seconds: 60) {
                        [weak self] t in
                        if self == nil {
                            t.invalidate()
                        }
                        let date = NSDate()
                        self?.label.text = self?.formatter.stringFromDate(date)
                    }
                }
            }
        } else {
            self.timer = NSTimer.runThisEvery(seconds: 60) {
                [weak self] t in
                if self == nil {
                    t.invalidate()
                }
                let date = NSDate()
                self?.label.text = self?.formatter.stringFromDate(date)
            }
        }
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
