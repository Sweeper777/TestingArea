import AppKit

class MyView : NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        layer = CALayer()
        let path1 = NSBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.midX, height: bounds.midY))
        NSColor.black.setStroke()
        NSColor.red.setFill()
        path1.lineWidth = 3
        path1.stroke()
        path1.fill()
        let path2 = NSBezierPath(rect: CGRect(x: bounds.midX, y: bounds.midY, width: bounds.midX, height: bounds.midY))
        NSColor.green.setFill()
        path2.lineWidth = 3
        path2.stroke()
        path2.fill()
    }
}
