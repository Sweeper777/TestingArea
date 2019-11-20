import UIKit
import NotificationCenter
import RealmSwift

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var vibrancy: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var config = Realm.Configuration()
        config.fileURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.io.github.sweeper777.TestingAreaGroup")!.appendingPathComponent("default.realm")
        Realm.Configuration.defaultConfiguration = config
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        vibrancy.effect = UIVibrancyEffect.widgetEffect(forVibrancyStyle: .label)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
    }
}
