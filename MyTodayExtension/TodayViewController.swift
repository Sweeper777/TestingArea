import UIKit
import NotificationCenter
import SwiftyUtils

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var vibrancy: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Bundle.main.appBuild)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(view.frame.height)
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
    }
}
