import AppKit

class MyView : NSView {
    
    override func draw(_ dirtyRect: NSRect) {
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
    
    override func viewDidMoveToWindow() {
        wantsLayer = true
        layer?.transform =
        CATransform3DScale(
            CATransform3DTranslate(
                CATransform3DIdentity,
                0, frame.height, 0),
            1, -1, 1)
    }
    
    override func mouseUp(with event: NSEvent) {
        let locationInWindow = event.locationInWindow
        let locationInSelf = self.convert(locationInWindow, from: self.window?.contentView)
        print(locationInSelf)
    }
}
