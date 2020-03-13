import AppKit

class MyView : NSView {
    
    var svgStrings: [String]? {
        didSet {
            setNeedsDisplay(bounds)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let svg = svgStrings else { return }
        
        if svg.count == 1 {
            guard let path = NSBezierPath(svgString: svg.first!) else {
                print("cannot create path")
                return
            }
            let bounds = path.bounds
            let scaleFactor = min(self.bounds.width / bounds.width, self.bounds.height / bounds.height)
            let scale = AffineTransform(scale: scaleFactor)
            let translate = AffineTransform(translationByX: -bounds.origin.x, byY: -bounds.origin.y)
            path.transform(using: translate)
            path.transform(using: scale)
            path.lineWidth = 1
            NSColor.textColor.setStroke()
            path.stroke()
            return
        }
        
        for string in svg {
            guard let path = NSBezierPath(svgString: string) else {
                print("cannot create path")
                continue
            }
            
            path.lineWidth = 1
            NSColor.textColor.setStroke()
            path.stroke()
        }
    }
    
    override var isFlipped: Bool {
        true
    }
}
