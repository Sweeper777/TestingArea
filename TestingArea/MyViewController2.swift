import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils

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
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = [
            kCGPDFContextCreator as String: "My App",
            kCGPDFContextAuthor as String: "Sweeper777"
          ]
        let paragraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar, massa vitae malesuada sollicitudin, mauris purus condimentum metus, eget gravida nunc mauris sit amet orci. Cras nec magna turpis. Cras risus justo, ullamcorper id ex quis, lobortis mattis elit. Nunc a ligula auctor dolor cursus lobortis id ac velit. Cras eget tincidunt dui, eget auctor purus. Nunc quam urna, vulputate at est at,\n\n\n\n\n\n sodales aliquam neque. Praesent tincidunt, justo nec pellentesque imperdiet, nulla justo tristique ligula, quis maximus elit nulla eget diam. Praesent a nunc id orci rhoncus tempus et vitae mi. Donec commodo elementum neque a eleifend. Praesent faucibus pretium faucibus. In hac habitasse platea dictumst. Mauris rhoncus nisi nisi, at venenatis diam ornare auctor."

        let data = PDFCreator().pdfWithText(paragraph + "\n\n\n\n" + paragraph, attributes: [.font: UIFont.monospacedSystemFont(ofSize: 16, weight: .regular)])
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test.pdf")
            try data.write(to: url, options: .atomic)
            print("Written PDF file to \(url)")
        } catch {
            print(error)
        }
    }
    
    
    @IBAction private func click() {
        
    }
}
