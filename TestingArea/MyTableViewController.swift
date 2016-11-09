import UIKit

class MyTableViewController: UIViewController, UITableViewDataSource {
    let people = [
        ("Pankaj","Dhaka"),
        ("Asish","Madaripur"),
        ("Anup","Narail")
    ]
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "People"
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let (personName , personLocation) = people[indexPath.row]
        cell.textLabel?.text = personName
        cell.textLabel?.text = personLocation
        return cell
    }
}
