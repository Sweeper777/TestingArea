import UIKit
import SwiftyUtils
import EZSwiftExtensions
import RealmSwift

class MyViewController2: UIViewController {
    override func viewDidLoad() {
        
    }
class Person: Object {
    static var nextID = 0
    
    dynamic var name: String = "Unnamed"
    dynamic var age: Int = 0
    dynamic var isMarried: Bool = false
    dynamic var id: Int = Person.nextID
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
}
