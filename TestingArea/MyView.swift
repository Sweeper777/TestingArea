import UIKit

class GameView: UIView {
    override func draw(_ rect: CGRect) {
}

protocol GameObject {
    var velocity: (CGFloat, CGFloat) { get set }
    var zIndex: Int { get set }
    var position: CGPoint { get set }
    
    func draw(in rect: CGRect)
    
    func isOutOf(rect: CGRect) -> Bool
}
        UIColor.red.setFill()
        path.fill()
    }
    
    }
}
