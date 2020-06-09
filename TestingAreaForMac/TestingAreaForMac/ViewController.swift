import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var button: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func f(_ sender: Any) {
        button.performClick(nil)
    }
    
}
