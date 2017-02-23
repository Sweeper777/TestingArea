import UIKit
import ESPullToRefresh

class MyTableViewController: UITableViewController {
    var array = ["John", "Tom", "Jerry"]
    
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel!.text = "Hello \(array[indexPath.row])"
        return cell!
    }
    
    override func viewDidLoad() {
        tableView.es_addPullToRefresh {
            [weak self] in
            Timer.runThisAfterDelay(seconds: 1) {
                self?.array = ["Everest", "Eugene", "Boris"]
                self?.tableView.reloadData()
                self?.tableView.es_stopPullToRefresh()
            }
        }
    }
}
