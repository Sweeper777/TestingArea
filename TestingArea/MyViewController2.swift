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
        
        let tagSchemes = [NSLinguisticTagSchemeLanguage]
        let tagger = NSLinguisticTagger(tagSchemes: tagSchemes, options: 0)
        tagger.string = "hello"
        let language = tagger.tagAtIndex(0, scheme: NSLinguisticTagSchemeLanguage, tokenRange: nil, sentenceRange: nil)
        print(language)
    }

    override func viewDidLayoutSubviews() {
    }
}
