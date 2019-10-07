import UIKit
import NotificationCenter
import RealmSwift

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Max number is: Fetching..."
        var config = Realm.Configuration()
        config.fileURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.io.github.sweeper777.TestingAreaGroup")!.appendingPathComponent("default.realm")
        Realm.Configuration.defaultConfiguration = config
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let sorted = RealmWrapper.shared.realm.objects(Entity.self).sorted(byKeyPath: "number", ascending: false)
        label.text = "Max number is: \(sorted.first?.number.description ?? "None")"
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        let sorted = RealmWrapper.shared.realm.objects(Entity.self).sorted(byKeyPath: "number", ascending: false)
        label.text = "Max number is: \(sorted.first?.number.description ?? "None")"
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
    }
}
