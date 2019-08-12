import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
    
    @IBAction func item2Pressed(_ sender: NSMenuItem) {
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
}

