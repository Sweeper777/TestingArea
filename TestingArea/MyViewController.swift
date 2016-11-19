import UIKit
import EZSwiftExtensions
import AVFoundation

class MyViewController: UIViewController {
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        let synth = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "")
        utterance.voice = AVSpeechSynthesisVoice(language: "hy")
        synth.speak(utterance)
        print(AVSpeechSynthesisVoice.speechVoices().map{$0.language})
        //Ժամանակն է
    }
}
