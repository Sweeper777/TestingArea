import AppKit

class MyView : NSView {
    
    var svgStrings: [String]? {
        didSet {
            setNeedsDisplay(bounds)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let svg = svgStrings else { return }
        
        
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
