import UIKit
import EZLoadingActivity

class MyViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        EZLoadingActivity.Settings.DarkensBackground = true
        EZLoadingActivity.showWithDelay("Hello", disableUI: true, seconds: 3)
    }
}
