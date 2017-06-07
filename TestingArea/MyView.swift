import UIKit

@IBDesignable
class MyView: UILabel {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = .red
    }

}
