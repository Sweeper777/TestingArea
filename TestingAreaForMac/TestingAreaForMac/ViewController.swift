import Cocoa

class ViewController: NSViewController {
    
    var myView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = MyView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        view.addSubview(myView)
        
    }
    
    override func viewDidAppear() {
        myView.wantsLayer = true
        myView.layer?.transform = CATransform3DScale(CATransform3DTranslate(CATransform3DIdentity, 0, 100, 0), 1, -1, 1)
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        
    }
    
    @IBAction func item2Pressed(_ sender: NSMenuItem) {
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
}

