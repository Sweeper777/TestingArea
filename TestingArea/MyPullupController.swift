import UIKit
import ISHPullUp

class MyPullupController: ISHPullUpViewController {
    override func viewDidLoad() {
        let contentVC = UIStoryboard.main?.instantiateViewController(withIdentifier: "MyVC")
        let bottomVC = UIStoryboard.main?.instantiateViewController(withIdentifier: "PullupVC") as! MyViewController
        contentViewController = contentVC
        bottomViewController = bottomVC
        sizingDelegate = bottomVC
        stateDelegate = bottomVC
    }
}
