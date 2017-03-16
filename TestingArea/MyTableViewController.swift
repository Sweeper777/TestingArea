import UIKit
import ESPullToRefresh
import RealmSwift

class MyTableViewController: UITableViewController {
    var array: Results<Person>!
    
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel!.text = array[indexPath.row].name
        cell!.detailTextLabel!.text = "\(array[indexPath.row].age), \(array[indexPath.row].isMarried)"
        return cell!
    }
    
    override func viewDidLoad() {
        let realm = (UIApplication.shared.delegate as! AppDelegate).realm!
        array = realm.objects(Person.self).sorted(byKeyPath: "name")
    }
}
