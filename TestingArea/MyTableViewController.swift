import UIKit
import RxSwift
import RxCocoa

class MyTableViewController: UITableViewController {
    let model = Variable<[String]>(["Tom", "Dick", "Harry", "Donald", "Lucy", "Lily", "Olivia"])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        tableView.allowsSelection = false
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                print("timer")
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.value[indexPath.row]
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
