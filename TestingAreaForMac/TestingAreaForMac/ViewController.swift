import Cocoa
import AVFoundation

class ViewController: NSViewController {
    
    @IBOutlet var button: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let t = Test()
        let ref = t.$value
        ref
    }
    
    @IBAction func f(_ sender: Any) {
        button.performClick(nil)
    }
    
}

@propertyWrapper
class Reference<T> {
    private var value: T
    
    init(wrappedValue: T) { value = wrappedValue }
    
    var wrappedValue: T {
        get { value }
        set { value = newValue }
    }
    
    var projectedValue: Self { self }
}

struct Test {
    @Reference var value: Int = 1
}
