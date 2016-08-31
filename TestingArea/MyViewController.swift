import UIKit
import EZSwiftExtensions
import FittableFontLabel

class MyViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    override func viewDidLoad() {
        let label = UILabel(frame: image.frame)
        let attr: [String: AnyObject] = [
            NSFontAttributeName: UIFont.systemFontOfSize(label.fontSizeThatFits(text: "hello world", maxFontSize: 500)),
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.blackColor()
        ]
        
        image.image = imageFromString("hello world", attributes: attr, size: image.size)
    }
    
    func imageFromString(string: String, attributes: [String : AnyObject]?, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        string.drawInRect(CGRectMake(0, 0, size.width, size.height), withAttributes: attributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
