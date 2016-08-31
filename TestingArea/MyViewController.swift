import UIKit
import EZSwiftExtensions

class MyViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    override func viewDidLoad() {
        let attr: [String: AnyObject] = [
            NSFontAttributeName: UIFont.systemFontOfSize(100),
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
