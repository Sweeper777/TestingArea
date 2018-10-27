import Foundation

struct TriangularArray<T> : Sequence, ExpressibleByArrayLiteral {
    
    var innerArray: [[T]]
    let rowCount: Int
    
    init(rowCount: Int, defaultValue: T) {
        self.rowCount = rowCount
        self.innerArray = []
        for i in 0..<rowCount {
            innerArray.append(Array(repeating: defaultValue, count: i + 1))
        }
    }
}

