import UIKit
import Combine
import Alamofire
import SCLAlertView

class MyTableViewController: UITableViewController {

    let data = ["Hello", "World", "Some", "Text"]
    
    @objc func foo() {
        print("Hello World")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(tableView.cellForRow(at: IndexPath(row: 1, section: 0)) ?? "nil")
    }
    
    
}

