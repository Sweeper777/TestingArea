import RealmSwift


final class RealmWrapper {
    let entities: Results<Entity>!
    let realm: Realm!
    
    private init() {
        do {
            realm = try Realm()
            entities = realm.objects(Entity.self)
        } catch let error {
            print(error)
            fatalError()
        }
    }
    
    private static var _shared: RealmWrapper?
    
    static var shared: RealmWrapper {
        _shared = _shared ?? RealmWrapper()
        return _shared!
    }
}

class Entity: Object {
    var kids = List<String>()
}
