import UIKit
import SwiftyUtils
import SwiftyJSON
import Firebase

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    
    let image = UIImage(named: "example")!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        let vision = Vision.vision()
        let textRecognizer = vision.onDeviceTextRecognizer()
        let vImage = VisionImage(image: image)
        textRecognizer.process(vImage) { (result, error) in
            guard error == nil, let result = result else {
                print("An error occurred: \(error!.localizedDescription)")
                return
            }
            let blocks = result.blocks
            for (index, block) in blocks.enumerated() {
                print("Block \(index)")
                print("Frame: \(block.frame)")
                for line in block.lines {
                    print("Line: \(line.text)")
                }
                print("-----------------")
            }
        }
    }
    
    @IBAction func click() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
