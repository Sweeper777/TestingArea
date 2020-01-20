import UIKit
import SwiftyUtils
import SwiftyJSON

class MyTableViewController: UITableViewController {
    var strings = [("Some Very Long Black Text That Doesn't Fit. Foo Bar Baz.", ""),
                   ("A", "Short Text"),
                   ("B", "Foo Bar"),
                   ("Some Very Long Grey Text That Doesn't Fit. Foo Bar Baz", "Some Very Long Grey Text That Doesn't Fit. Foo Bar Baz"),
                   ("C", "Another Text")]
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel!.text = strings[indexPath.row].0
        cell.detailTextLabel!.text = strings[indexPath.row].1
        return cell
    }
    
}
