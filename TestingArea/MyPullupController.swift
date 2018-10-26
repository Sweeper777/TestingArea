import UIKit
import ISHPullUp

class MyPullupController: ISHPullUpViewController {
    override func viewDidLoad() {
        self.contentViewController = UIStoryboard.main?.instantiateViewController(withIdentifier: "MyVC")
        self.bottomViewController = UIStoryboard.main?.instantiateViewController(withIdentifier: "PullupVC")
    }
}
