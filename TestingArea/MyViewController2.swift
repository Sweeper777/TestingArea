import UIKit
import AVFoundation

class MyViewController2: UIViewController {
    @IBAction func item(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let synth = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "你好")
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-cn")
        synth.speakUtterance(utterance)
    }

}
