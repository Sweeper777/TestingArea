import UIKit
import AVFoundation
import DoneToolbarSwift
import EZSwiftExtensions

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
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        let speech = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "你好，你在幹什麼啦")
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-hk")
        speech.speakUtterance(utterance)
    }
}
