import UIKit

class MyTableViewController: UITableViewController {
    var cells: [[UITableViewCell]] = [[]]
    var rowH: CGFloat = 44
    var nextCellNum = 1
    
    override func viewDidLoad() {
        let cell = tableView.dequeueReusableCellWithIdentifier("add")
        cell!.textLabel!.font = UIFont(name: "DB LCD Temp", size: cell!.textLabel!.font!.pointSize)
        cell?.textLabel?.text = "16:52"
        addCellToSection(0, cell: cell!)
        
        let window = UIApplication.sharedApplication().keyWindow!
        let v = UIView(frame: CGRect(x: window.frame.origin.x, y: window.frame.origin.y, width: window.frame.width, height: window.frame.height))
        window.addSubview(v);
        v.backgroundColor = UIColor.blackColor()
        let v2 = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        v2.backgroundColor = UIColor.whiteColor()
        v.addSubview(v2)
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