import UIKit
import GoogleMaps
import TouchDraw

class MyViewController: UIViewController {
    @IBOutlet var touchDrawView: TouchDrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        touchDrawView.layer.borderWidth = 3
        touchDrawView.setWidth(2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func export(_ sender: AnyObject) {
        let stack = touchDrawView.exportStack()
        let data = NSKeyedArchiver.archivedData(withRootObject: stack)
        UserDefaults.standard.set(data, forKey: "drawing")
        touchDrawView.clearDrawing()
    }
    
    @IBAction func `import`(_ sender: AnyObject) {
        let data = UserDefaults.standard.data(forKey: "drawing")!
        let stack = NSKeyedUnarchiver.unarchiveObject(with: data) as! [Stroke]
        touchDrawView.importStack(stack)
    }
}
