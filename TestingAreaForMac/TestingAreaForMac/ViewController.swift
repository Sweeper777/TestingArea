import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
}

