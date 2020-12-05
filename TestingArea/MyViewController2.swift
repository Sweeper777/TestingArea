import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils
import Speech

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var bool = false
    
    @IBAction private func click() {
        if bool {
            stopRecording()
            bool.toggle()
        } else {
            try! startRecording(completion: {_ in})
            bool.toggle()
        }
    }
    
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()
    var timer: Timer? = nil {
        willSet {
            timer?.invalidate()
        }
    }
    

    private func startRecording(completion: @escaping (String) -> Void) throws {
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in

            if let result = result {
                // Update the text view with the results.
                let text = result.bestTranscription.formattedString
                print("Text: \(text)")
                completion(text)
            }

            if error != nil {
                print("error descr:", error!.localizedDescription)
            }

            self.timer?.invalidate()
            if result?.isFinal ?? false {
                self.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in
                    print("timed out!")
                    //self.stopRecording()
                })
            }
        }
    }

    func stopRecording() {
        recognitionTask?.finish()
        self.stopTimer()
    }

    func stopTimer(){
        //print("stopTimer()")
        self.timer?.invalidate()
        self.timer = nil
    }
}
