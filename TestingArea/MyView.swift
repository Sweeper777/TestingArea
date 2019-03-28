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

class Line : GameObject {
    
    init(position: CGPoint, velocity: (CGFloat, CGFloat), zIndex: Int, length: CGFloat, horizontal: Bool, color: UIColor) {
        self.zIndex = zIndex
        self.velocity = velocity
        self.position = position
        self.length = length
        self.horizontal = horizontal
        self.color = color
    }
    
    var zIndex: Int
    var velocity: (CGFloat, CGFloat)
    var position: CGPoint
    var length: CGFloat
    var horizontal: Bool
    var color: UIColor
    
}
        UIColor.red.setFill()
        path.fill()
    }
    
    }
}
