import UIKit
import EZSwiftExtensions

class MyViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    override func viewDidLoad() {
        let attr: [String: AnyObject] = [
            NSFontAttributeName: UIFont.systemFontOfSize(100),
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.blackColor(),
        ]
        
        let str = "Fuck you!\nBITCH!"
        
        let constraintSize = CGSizeMake(CGFloat.max, CGFloat.max)
        let fitSize = str.boundingRectWithSize(constraintSize, options: .UsesLineFragmentOrigin, attributes: attr, context: nil).size
        
        image.image = imageFromString(str, attributes: attr, size: fitSize)
    }
    
    func imageFromString(string: String, attributes: [String : AnyObject]?, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        string.drawInRect(CGRectMake(0, 0, size.width, size.height), withAttributes: attributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
