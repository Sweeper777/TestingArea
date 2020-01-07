import Foundation

struct Vessel : Decodable {
    let name: String
    let yard: String
    let yearBuilt: Int
    
    var age: Int {
        Calendar.current.dateComponents([.year], from: Date()).year! - yearBuilt
    }
    
    let shipClass: String
    let grossTonnage: Int
    let deadWeightTonnage: Int
    let flag: String
    let delivery: String
    let entry: String
    let PNI: String
    let ETC: Double
    let insuredValue: Double
    let rates: Double?
    let registeredOwner: String
}
