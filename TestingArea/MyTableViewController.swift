import UIKit
import Combine
import Alamofire

class MyTableViewController: UIViewController {

    override func viewDidLoad() {
        let encodedParameters = Dictionary<String, Any>()

        AF.request("", method: .get, parameters: encodedParameters)
        
    }
}

