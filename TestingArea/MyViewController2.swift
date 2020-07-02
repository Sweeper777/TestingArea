import UIKit
import RxSwift
import RxCocoa

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.alpha = 1
        view2.alpha = 0
        for x in ["a", "b", "c"] {
            loadData(key: x) { $0(&self.dict) }
        }
    }
    
    
    @IBAction func click() {
        print(dict)
    }
    
    func loadData(key: String, applyChanges: @escaping ((inout [String: String]) -> Void) -> Void) {
        // Load some data. Use DispatchQueue to simulate async request
        DispatchQueue.main.async {
            applyChanges { dict in
                dict[key] = "loadedData"
            }
        }
    }

    var dict = [String:String]()
}

class SearchViewController: UIViewController,UISearchBarDelegate {


    let seacrhController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupsearch()
       
     
    }
    

    func setupsearch(){
        seacrhController.searchBar.backgroundColor = .darkGray
//        navigationController?.navigationBar.barTintColor = .darkGray
        navigationItem.searchController = seacrhController
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        seacrhController.searchBar.delegate = self
    }

}
