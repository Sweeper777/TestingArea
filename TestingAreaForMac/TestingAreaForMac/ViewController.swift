import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        test3()
    }
    
    func completionHandler(_ response: NSApplication.ModalResponse) {
        switch response {
        case .abort:
            print("abort")
        case .alertFirstButtonReturn:
            print("alert first button return")
        case .alertSecondButtonReturn:
            print("alert second button return")
        case .alertThirdButtonReturn:
            print("alert third button return")
        case .stop:
            print("stop")
        case .continue:
            print("continue")
        default:
            print("something else")
        }
    }
}

