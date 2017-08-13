import UIKit
import RxSwift
import RxCocoa

class MyTableViewController: UITableViewController {
    let model = Variable<[String]>(["Tom", "Dick", "Harry", "Donald", "Lucy", "Lily", "Olivia"])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        tableView.allowsSelection = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyCell()
        cell.textLabel?.text = model.value[indexPath.row]
        cell.isUserInteractionEnabled = true
        return cell
    }
}

class MyCell: UITableViewCell {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = .red // or some other color
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = .white
        
    }
}
