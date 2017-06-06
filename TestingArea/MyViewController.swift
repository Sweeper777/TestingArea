import UIKit
import MessageUI
import CoreData

class MyViewController: UINavigationController {
    override func viewDidLoad() {
        navigationBar.topItem?.title = "Carpool"
        
        let languagesSpinner = UIBarButtonItem(title: "PT", style: .done, target: nil, action: nil)
        navigationItem.setRightBarButton(languagesSpinner, animated: true)
    }
}

