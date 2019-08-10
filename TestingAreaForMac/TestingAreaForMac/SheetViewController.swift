import Cocoa

class SheetViewController : NSViewController {
    override func viewDidLoad() {
        preferredContentSize = CGSize(width: 100, height: 100)
    }
    
    @IBAction func buttonPressed(_ sender: NSButton) {
        preferredContentSize = .zero
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.view.window?.setFrame(CGRect(x: 0, y: 0, width: 300, height: 300), display: true, animate: true)
        }
        
    }
}
