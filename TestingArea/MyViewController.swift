import UIKit
import MessageUI
import CoreData
import SwiftyUtils

class MyViewController: UIViewController {
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        func shouldContinueToEnlarge(targetSize: CGSize, currentSize: CGSize) -> Bool {
            return targetSize.height > currentSize.height && targetSize.width > currentSize.width
        }
        
        func fontSizeThatFits(size: CGSize, text: NSString, font: UIFont) -> CGFloat {
            var fontToTest = font.withSize(0)
            var currentSize = text.size(attributes: [NSFontAttributeName: fontToTest])
            var fontSize = CGFloat(1)
            while shouldContinueToEnlarge(targetSize: size, currentSize: currentSize) {
                fontToTest = fontToTest.withSize(fontSize)
                currentSize = text.size(attributes: [NSFontAttributeName: fontToTest])
                fontSize += 1
            }
            return fontSize - 1
        }

        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        label.text = "Hello World"
        label.textColor = .white
        label.backgroundColor = .black
        let fontSize = fontSizeThatFits(size: label.frame.size, text: label.text! as NSString, font: label.font)
        label.font = label.font.withSize(fontSize)
        self.view.addSubview(label)

    }
}

