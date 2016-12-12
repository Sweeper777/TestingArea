import UIKit

class MyTableViewController: UITableViewController {
     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "People"
    }
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel!.text = "Hello \(indexPath.row)"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
}
