import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var textfield: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        textfield.stringValue = "Changed!"
    }
    
    @IBAction func item2Pressed(_ sender: NSMenuItem) {
        
    }
}

extension ViewController : NSTextFieldDelegate {
    func controlTextDidChange(_ obj: Notification) {
        print("called")
    }
}
