import UIKit

class GameView: UIView {
    var gameObjects: [GameObject] = [] {
        didSet {
            let sorted = gameObjects.map { $0.zIndex }.sorted()
            if gameObjects.map({ $0.zIndex }) != sorted {
                gameObjects.sort { $0.zIndex < $1.zIndex }
            }
        }
    }
    var displayLink: CADisplayLink!
    
    override func draw(_ rect: CGRect) {
        for gameObject in gameObjects {
            gameObject.draw(in: self.bounds)
        }
    }
    
    func commonInit() {
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .main, forMode: .common)
    }
    
    @objc func update() {
        setNeedsDisplay()
    }
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
    
    func draw(in rect: CGRect) {
        if horizontal {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: position.x * rect.width, y: position.y * rect.height))
            path.addLine(to: CGPoint(x: (position.x + length) * rect.width, y: position.y * rect.height))
            path.lineWidth = 5
            color.setStroke()
            path.stroke()
        } else {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: position.x * rect.width, y: position.y * rect.height))
            path.addLine(to: CGPoint(x: position.x * rect.width * rect.width, y: (position.y + length) * rect.height))
            path.lineWidth = 5
            color.setStroke()
            path.stroke()
        }
    }
    
    func isOutOf(rect: CGRect) -> Bool {
        if horizontal {
            return position.x + length < 0
        } else {
            return position.y - length > 1
        }
    }
    
}

class Dot : GameObject {
    init(position: CGPoint, zIndex: Int) {
        self.zIndex = zIndex
        self.position = position
    }
    
    var velocity: (CGFloat, CGFloat) = (0, 0)
    var zIndex: Int
    var position: CGPoint
    
    func draw(in rect: CGRect) {
        let path = UIBezierPath(ovalIn: CGRect(x: position.x * rect.width, y: position.y * rect.height, width: 0, height: 0).insetBy(dx: -10, dy: -10))
        UIColor.red.setFill()
        path.fill()
    }
    
    func isOutOf(rect: CGRect) -> Bool {
        return !rect.intersects(CGRect(x: position.x * rect.width, y: position.y * rect.height, width: 0, height: 0).insetBy(dx: -10, dy: -10))
    }
}

class AndGate: GameObject {
    init(position: CGPoint, velocity: (CGFloat, CGFloat), zIndex: Int) {
        self.position = position
        self.velocity = velocity
        self.zIndex = zIndex
    }
    
    var velocity: (CGFloat, CGFloat)
    var zIndex: Int
    var position: CGPoint
    
    func draw(in rect: CGRect) {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: position.x * rect.width, y: position.y * rect.height), radius: rect.height / 8, startAngle: 3 * .pi / 2, endAngle: .pi / 2, clockwise: true)
        path.addLine(to: CGPoint(x: position.x * rect.width - rect.height / 8, y: (position.y + 0.125) * rect.height))
        path.addLine(to: CGPoint(x: position.x * rect.width - rect.height / 8, y: (position.y - 0.125) * rect.height))
        path.close()
        path.lineWidth = 10
        UIColor.white.setFill()
        UIColor.black.setStroke()
        path.stroke()
        path.fill()
    }
    
    func isOutOf(rect: CGRect) -> Bool {
        return !rect.intersects(CGRect(x: position.x * rect.width, y: position.y * rect.height, width: 0, height: 0).insetBy(dx: rect.height / -8, dy: rect.height / -8))
    }
    
    
}
