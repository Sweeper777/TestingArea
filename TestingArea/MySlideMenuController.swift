import UIKit
import SlideMenuControllerSwift

class MySlideMenuController: SlideMenuController {

    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "MyVC") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "RightVC") {
            self.rightViewController = controller
        }
        super.awakeFromNib()
    }

}
