import UIKit
import RxSwift
import RxDataSources
import RxCocoa

class MyTableViewController: UICollectionViewController {
    let observable = Variable(["Hello", "World", "Bye", "Foo", "Bar"])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        collectionView.dataSource = nil
        collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        let dataSource = RxCollectionViewSectionedAnimatedDataSource<StringSection>(configureCell:  {
            (dataSource, collectionView, indexPath, string) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
            cell.textLabel.text = string.wrapped
            return cell
        })
        observable.asObservable()
            .map {
                [StringSection(items: $0)]
            }
            .bind(to: self.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        DispatchQueue.main.async {
            self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        observable.value.append("XXX")
    }
}

struct StringSection : AnimatableSectionModelType {
    var items: [StringWrapper]
    
    init(original: StringSection, items: [StringWrapper]) {
        self = original
        self.items = items
    }
    
    init(items: [String]) {
        self.items = items.map(StringWrapper.init)
    }
    
    typealias Item = StringWrapper
    
    typealias Identity = String
    
    var identity: String { return "" }
}

class StringWrapper : IdentifiableType, Equatable {
    
    var wrapped = ""
    
    typealias Identity = String
    
    var identity: String {
        return wrapped
    }
    
    init(_ string: String) {
        wrapped = string
    }
    
    static func ==(lhs: StringWrapper, rhs: StringWrapper) -> Bool {
        return lhs.wrapped == rhs.wrapped
    }
}
