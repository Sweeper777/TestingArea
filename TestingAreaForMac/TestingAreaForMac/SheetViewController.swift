import Cocoa

class SheetViewController : NSViewController {
    override func viewDidLoad() {
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window!.styleMask.remove(.resizable)
    }
    
    @IBAction func buttonPressed(_ sender: NSButton) {
        view.window?.setFrame(CGRect(x: 0, y: 0, width: 300, height: 300), display: true, animate: true)
        
    }
}

@objc class Test: NSObject {

    @objc func testBoolean() -> Bool {
        return true
    }

    func testOptionalBoolean() -> Bool? {
        return true
    }
    
    @objc func testOptionalBoolean() -> NSNumber? {
        return testOptionalBoolean().map(NSNumber.init(value:))
    }
}
