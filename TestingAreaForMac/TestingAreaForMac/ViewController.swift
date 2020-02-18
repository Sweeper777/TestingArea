import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var outlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController: NSOutlineViewDataSource, NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let node = item as? Node {
            return node.children.count
        }
        return testTree.children.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let node = item as? Node {
            return node.children[index]
        }
        return testTree.children[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let node = item as? Node {
            return node.children.count > 0
        }
        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let node = item as! Node
        if tableColumn?.identifier.rawValue == "titleColumn" {
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "titleCell"), owner: nil) as! NSTableCellView
            view.textField?.stringValue = node.title
            return view
        } else if tableColumn?.identifier.rawValue == "descriptionColumn" {
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "descriptionCell"), owner: nil) as! NSTableCellView
            view.textField?.stringValue = node.detail
            return view
        } else {
            return nil
        }
    }
}
