import Cocoa

class ViewController: NSViewController {
    
    var myView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = MyView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        view.addSubview(myView)
        
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        
    }
    
    @IBAction func item2Pressed(_ sender: NSMenuItem) {
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
}

