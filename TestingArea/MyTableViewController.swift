import UIKit

class MyTableViewController: UITableViewController {
     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "People"
    }
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel!.text = "Hello \(indexPath.row)"
        return cell!
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        // 1
        let printController = UIPrintInteractionController.shared
        // 2
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "print Job"
        printController.printInfo = printInfo
        
        // 3
        var text = ""
        for _ in 0..<2000 {
            text += "X"
        }
        
        let formatter = self.view.viewPrintFormatter()
        
        formatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printController.printFormatter = formatter
        
        // 4
        printController.present(animated: true, completionHandler: nil)
    }
}
