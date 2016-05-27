import UIKit
import EZLoadingActivity
import SwiftyJSON

class MyTableViewController: UITableViewController {
    var cells: [[UITableViewCell]] = [[]]
    
    override func viewDidLoad() {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hi \(cells[0].endIndex)"
        addCellToSection(0, cell: cell)
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
        /*let cell = UITableViewCell()
        cell.textLabel?.text = "Hi \(cells[0].endIndex)"
        addCellToSection(0, cell: cell)*/
        let myURL = NSURL(string: "https://sweeper777.github.io/mathtoolbox/CustOp/test.txt")
        
        if myURL == nil {
            print("wrong url!")
            return
        }
        
        func loadStringAndParseJSON() -> String? {
            var myHTMLString: String! = try? String(contentsOfURL: myURL!)
            if myHTMLString == nil {
                return nil
            }
            
            myHTMLString = "[" + myHTMLString.stringByReplacingOccurrencesOfString("“", withString: "\"").stringByReplacingOccurrencesOfString("”", withString: "\"") + "]"
            
            let json = JSON(data: myHTMLString.dataUsingEncoding(NSUnicodeStringEncoding)!)
            return json[0]["name"].string
        }
        
        func showAlert(str: String?) {
            EZLoadingActivity.hide()
            let alert = UIAlertController(title: "", message: str ?? "Error occurred", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
        
        EZLoadingActivity.show("Loading", disableUI: true);
        { loadStringAndParseJSON() } ~> { showAlert($0) };
    }
    
    @IBAction func remove(sender: UIBarButtonItem) {
        //removeCellFromSection(0, index: cells[0].endIndex - 1)
        
        UIApplication.sharedApplication().openURL(NSURL(string: "test://mathtoolbox/custop?json={\"name\":\"Hello\"}".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!)
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

extension Array where Element : CollectionType,
Element.Generator.Element : Equatable, Element.Index == Int {
    func indicesOf(x: Element.Generator.Element) -> (Int, Int)? {
        for (i, row) in self.enumerate() {
            if let j = row.indexOf(x) {
                return (i, j)
            }
        }
        return nil
    }
}