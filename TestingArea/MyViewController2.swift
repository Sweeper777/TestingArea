import UIKit
import SwiftyUtils
import EZSwiftExtensions
import SwiftyJSON

class MyViewController2: UIViewController {
    override func viewDidLoad() {
    }
    
    func test1() {
        let json = JSON(dictionaryLiteral: ("name", "My Quiz"), ("questions", [Any]()))
        print(json)
    }
    
    func test2() {
    }
    
    func test3() {
    }
}
