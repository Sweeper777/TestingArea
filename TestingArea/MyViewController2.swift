import UIKit
import SwiftyUtils
import EZSwiftExtensions
import RealmSwift
import SwiftRandom

class MyViewController2: UIViewController {
    override func viewDidLoad() {
        test4()
    }
    
    func test1() {
        let realm = (UIApplication.shared.delegate as! AppDelegate).realm!
        let tom = Person()
        tom.name = "Tom"
        tom.age = 30
        tom.isMarried = false
        
        let john = Person()
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
    
    func test3() {
        let realm = (UIApplication.shared.delegate as! AppDelegate).realm!
        let freddy = Person()
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
    
    func test4() {
        let realm = (UIApplication.shared.delegate as! AppDelegate).realm!
        try! realm.write {
            for _ in 0..<100 {
                let person = Person()
                person.name = Randoms.randomFakeName()
                person.age = Int.random(0, 100)
                person.isMarried = Bool.random()
                realm.add(person)
            }
        }
    }
}

class Person: Object {
    dynamic var name: String = "Unnamed"
    dynamic var age: Int = 0
    dynamic var isMarried: Bool = false
    dynamic var id: String = NSUUID().uuidString
    
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
