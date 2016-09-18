import UIKit

class MyTableViewController: UITableViewController {
    var cells: [[UITableViewCell]] = [[]]
    var rowH: CGFloat = 44
    var nextCellNum = 1
    
    override func viewDidLoad() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "add")
        cell!.textLabel!.font = UIFont(name: "DB LCD Temp", size: cell!.textLabel!.font!.pointSize)
        cell?.textLabel?.text = "16:52"
        addCellToSection(0, cell: cell!)
        
        let window = UIApplication.shared.keyWindow!
        let v = UIView(frame: CGRect(x: window.frame.origin.x, y: window.frame.origin.y, width: window.frame.width, height: window.frame.height))
        window.addSubview(v);
        v.backgroundColor = UIColor.black
        let v2 = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        v2.backgroundColor = UIColor.white
        v.addSubview(v2)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
    }
    
    func addCellToSection(_ section: Int, cell: UITableViewCell) {
        cells[section].append(cell)
        tableView.insertRows(at: [IndexPath(row: cells[section].endIndex - 1, section: section)], with: .left)
    }
    
    func removeCellFromSection(_ section: Int, index: Int) {
        cells[section].remove(at: index)
        tableView.deleteRows(at: [IndexPath(row: index, section: section)], with: .left)
    }
    
    @IBAction func reload(_ sender: AnyObject) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normal")
        cell?.textLabel?.text = "Cell \(nextCellNum)"
        
        nextCellNum += 1
        
        addCellToSection(0, cell: cell!)
    }
}
