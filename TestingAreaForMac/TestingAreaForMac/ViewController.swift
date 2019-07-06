import Cocoa

class ViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    
    let dataSource = ["Hello", "World", "Foo", "Bar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}
