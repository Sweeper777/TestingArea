import UIKit
import AVFoundation
import FittableFontLabel

class MyViewController2: UIViewController {
    @IBOutlet var label: UILabel!
    @IBAction func item(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        label.text = ""
        print(label.fontSizeThatFits(text: "00:00", maxFontSize: 500))
        print(label.fontSizeThatFits(text: "00:00:00", maxFontSize: 500))
    }
}
