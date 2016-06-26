import UIKit

class MyTableViewController: UITableViewController {
    var cells: [[UITableViewCell]] = [[]]
    var rowH: CGFloat = 44
    
    override func viewDidLoad() {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello"
        addCellToSection(0, cell: cell)
        
        let cell2 = UITableViewCell()
        cell2.textLabel?.text = "Hello2"
        addCellToSection(0, cell: cell2)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cells.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
    }
    
    
    
    @IBAction func add(sender: UIBarButtonItem) {
        rowH += 20
        tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .None)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return rowH
        } else {
            return 44
        }
    }
    
    func addCellToSection(section: Int, cell: UITableViewCell) {
        cells[section].append(cell)
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: cells[section].endIndex - 1, inSection: section)], withRowAnimation: .Left)
    }
    
    func removeCellFromSection(section: Int, index: Int) {
        cells[section].removeAtIndex(index)
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: section)], withRowAnimation: .Left)
    }
}