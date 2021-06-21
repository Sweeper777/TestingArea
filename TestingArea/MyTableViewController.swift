import UIKit
import Combine
import Alamofire
import SCLAlertView

class MyTableViewController: UITableViewController {

    let data = ["Hello", "World", "Some", "Text"]
    
    override func viewDidLoad() {
        DispatchQueue.global().async {
            DispatchQueue.main.sync {
                print("Hello")
            }
        }
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        cell.becomeFirstResponder()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

