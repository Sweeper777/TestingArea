import UIKit

class MyViewController: UIViewController {
    override func viewDidLoad() {
        let string = try! String(contentsOfFile: Bundle.main.path(forResource: "test", ofType: "txt")!)
        print(string.characters.last! == "\n")
    }
}

