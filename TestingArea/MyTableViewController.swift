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
            cell.textLabel.text = string
            return cell
        })
        observable.asObservable()
            .map {
                [StringSection(items: $0)]
            }
            .bind(to: self.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        observable.value.append("XXX")
    }
}

struct StringSection : AnimatableSectionModelType {
    var items: [String]
    
    init(original: StringSection, items: [String]) {
        self = original
        self.items = items
    }
    
    init(items: [String]) {
        self.items = items
    }
    
    typealias Item = String
    
    typealias Identity = String
    
    var identity: String { return "" }
}
