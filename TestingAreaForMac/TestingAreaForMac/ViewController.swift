import Cocoa

class ViewController: NSViewController {
    
    var myView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = MyView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        view.addSubview(myView)
        
    }
    
    override func viewDidAppear() {
//        myView.layer?.transform = CATransform3D(m11: 1, m12: 0, m13: 0, m14: 0,
//                                                m21: 0, m22: -2, m23: 0, m24: 0,
//                                                m31: 0, m32: 0, m33: 1, m34: 0,
//                                                m41: 0, m42: 0, m43: 0, m44: 1)
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        
    }
    
    @IBAction func item2Pressed(_ sender: NSMenuItem) {
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
}

