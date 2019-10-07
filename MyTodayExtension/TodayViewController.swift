import UIKit
import NotificationCenter
import RealmSwift

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Max number is: Fetching..."
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
    
}
