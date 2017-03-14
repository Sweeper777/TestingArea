import UIKit
import SwiftyUtils
import EZSwiftExtensions
import RealmSwift

class MyViewController2: UIViewController {
    override func viewDidLoad() {
        
    }
    
    func test1() {
        let realm = (UIApplication.shared.delegate as! AppDelegate).realm!
        let tom = Person()
        Person.nextID += 1
        tom.name = "Tom"
        tom.age = 30
        tom.isMarried = false
        
        let john = Person()
        Person.nextID += 1
        john.name = "John"
        john.age = 20
        john.isMarried = true
        
        try! realm.write {
            realm.add(tom)
            realm.add(john)
        }
        
    }
    
    func test2() {
        let realm = (UIApplication.shared.delegate as! AppDelegate).realm!
        let people = realm.objects(Person.self)
        print(people)
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
