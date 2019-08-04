import Cocoa

class SheetViewController : NSViewController {
    @IBAction func buttonPressed(_ sender: NSButton) {
        view.window?.setFrame(CGRect(x: 0, y: 0, width: 300, height: 300), display: true, animate: true)
    }
}
