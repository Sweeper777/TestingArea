import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import SCLAlertView
import SwiftyJSON

class MyViewController2: UIViewController {
    @IBOutlet var textView: UITextView!
    
    @IBAction func btnClicked(sender: UIButton) {
    }
    
    func test1() {
        let request = URLRequest(url: URL(string: "https://api.fixer.io/latest?base=HKD")!)
        let task = URLSession.shared.dataTask(with: request) { (data, reponse, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.textView.text = String(data: data!, encoding: String.Encoding.utf8)!
            }
        }
        
        task.resume()
    }
    
    func home() {
        print("Home tapped")
    }
    
    func settings() {
        print("Settings tapped")
    }
    
    @IBAction func changed() {
        print("changed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
