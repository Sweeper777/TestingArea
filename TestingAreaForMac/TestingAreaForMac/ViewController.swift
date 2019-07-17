import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        test4()
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
    
    func test1() {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.messageText = "Message Text"
        alert.informativeText = "Informative Text"
        alert.beginSheetModal(for: view.window!, completionHandler: completionHandler)
    }
    
    func test2() {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        alert.addButton(withTitle: "Something Else")
        alert.messageText = "Message Text"
        alert.informativeText = "Informative Text"
        completionHandler(alert.runModal())
    }
    
    func test3() {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.messageText = "Message Text"
        alert.informativeText = "Informative Text"
        alert.accessoryView = NSTextField(frame: NSRect(x: 20, y: 50, width: 400, height: 20))
        alert.beginSheetModal(for: view.window!, completionHandler: completionHandler)
    }
    
    func test4() {
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
}

