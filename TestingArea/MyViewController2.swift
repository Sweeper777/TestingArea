import UIKit
import AVFoundation
import DoneToolbarSwift

class MyViewController2: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBAction func item(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let toolbar = ToolbarWithDone(viewsWithToolbar: [textField])
        toolbar.barTintColor = UIColor(hexString: "5abb5a")
        toolbar.tintColor = UIColor.whiteColor()
//        textField.inputView = toolbar.generateInputView(textField)
        textField.inputAccessoryView = toolbar
    }

    override func viewDidLayoutSubviews() {
    }
}
