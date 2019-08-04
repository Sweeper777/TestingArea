import Cocoa

class SheetViewController : NSViewController {
    @IBAction func buttonPressed(_ sender: NSButton) {
        preferredContentSize = CGSize(width: 300, height: 300)
    }
}
