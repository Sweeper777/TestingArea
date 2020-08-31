import Cocoa
import AVFoundation

class ViewController: NSViewController {
    
    @IBOutlet var button: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func f(_ sender: Any) {
        let result = FileManager.default.createFile(atPath: "/Users/mulangsu/Desktop/test.txt", contents: "Hello".data(using: .utf8))
        print(result)
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
