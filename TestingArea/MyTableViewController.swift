import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import EmptyDataSet_Swift

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
        
        collectionView.emptyDataSetView { (view) in
            view.titleLabelString(NSAttributedString(string: "Nothing to see here!"))
            view.shouldDisplay(true)
        }
        
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
        observable.value[0] = "Hello"
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


class StringWrapper : ExpressibleByStringLiteral {
    typealias StringLiteralType = String
    
    var wrapped = ""
    
    init(_ string: String) {
        wrapped = string
    }
    
    required convenience init(stringLiteral value: String) {
        self.init(value)
    }
}
