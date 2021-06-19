import UIKit

class MyCell: UITableViewCell {
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionBegan(motion, with: event)
        print("Moved!")
    }
    
    override var canBecomeFirstResponder: Bool {
        true
    }
}
