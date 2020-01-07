import Cocoa
import CSV

class ViewController: NSViewController {
    
    @IBOutlet var textfield: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        var records = [Vessel]()
        do {
            let csvString = try String(contentsOfFile: "/Users/mulangsu/Downloads/csv.csv")
            let reader = try CSVReader(string: csvString, hasHeaderRow: true)
            let decoder = CSVRowDecoder()
            while reader.next() != nil {
                let row = try decoder.decode(Vessel.self, from: reader)
                records.append(row)
            }
        } catch let error {
            print(error)
        }
        print("Read \(records.count) Records")
    }
    
    @IBAction func item2Pressed(_ sender: NSMenuItem) {
        
    }
}

extension ViewController : NSTextFieldDelegate {
    func controlTextDidChange(_ obj: Notification) {
        print("called")
    }
}
