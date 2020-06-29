import UIKit
import Combine
import Alamofire
import TimelineTableViewCell

class MyTableViewController: UITableViewController {

    var itemCount = 7
    override func viewDidLoad() {
        tableView.register(TimelineItemCell.self, forCellReuseIdentifier: "timelineItemCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        itemCount > 3 ? 2 : 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemCount > 3 {
            return section == 1 ? itemCount : 1
        } else {
            return itemCount
        }
    }
    
    var editableSection: Int {
        itemCount > 3 ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if itemCount > 3 {
            return indexPath.section == 1
        } else {
            return true
        }
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if itemCount > 3 {
            return indexPath.section == 1 ? .delete : .none
        } else {
            return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        itemCount -= 1
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .automatic)
//        tableView.reloadSections([indexPath.section], with: .automatic)
        if itemCount == 3 {
            tableView.deleteSections([0], with: .automatic)
        }
        tableView.endUpdates()
    }
}

