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
    
    func test3() {
        let realm = (UIApplication.shared.delegate as! AppDelegate).realm!
        let freddy = Person()
        freddy.id = 2
        freddy.name = "Freddy"
        freddy.age = 30
        freddy.isMarried = false
        let dog1 = Dog()
        dog1.name = "Fido"
        dog1.age = 3
        freddy.dogs.append(dog1)
        
        try! realm.write {
            realm.add(freddy)
        }
    }
    dynamic var name: String = "Unnamed"
    dynamic var age: Int = 0
    dynamic var isMarried: Bool = false
    dynamic var id: Int = Person.nextID
    
    let dogs = List<Dog>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Dog: Object {
    dynamic var name: String = "Unnamed"
    dynamic var age: Int = 0
    let owner = LinkingObjects(fromType: Person.self, property: "dogs")
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
