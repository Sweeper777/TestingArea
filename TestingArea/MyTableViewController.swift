import UIKit

class MyTableViewController: UITableViewController {
    var cells: [[UITableViewCell]] = [[]]
    var rowH: CGFloat = 44
    var nextCellNum = 1
    
    override func viewDidLoad() {
        let cell = tableView.dequeueReusableCellWithIdentifier("add")
        addCellToSection(0, cell: cell!)
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
    
    func addCellToSection(section: Int, cell: UITableViewCell) {
        cells[section].append(cell)
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: cells[section].endIndex - 1, inSection: section)], withRowAnimation: .Left)
    }
    
    func removeCellFromSection(section: Int, index: Int) {
        cells[section].removeAtIndex(index)
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: section)], withRowAnimation: .Left)
    }
    
    @IBAction func reload(sender: AnyObject) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("normal")
        cell?.textLabel?.text = "Cell \(nextCellNum)"
        
        nextCellNum += 1
        
        addCellToSection(0, cell: cell!)
    }
}