import UIKit
import Eureka
import SCLAlertView

class MyViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //Step 1
        let scrollview = UIScrollView()
        view.addSubview(scrollview)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollview.alwaysBounceVertical = true
        
        let oneview = UIStackView()
        oneview.alignment = .fill
        oneview.distribution = .equalSpacing
        oneview.spacing = 50
        oneview.axis = .vertical
        scrollview.addSubview(oneview)
        oneview.translatesAutoresizingMaskIntoConstraints = false
        oneview.topAnchor.constraint(equalTo: scrollview.topAnchor).isActive = true
        oneview.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor).isActive = true
        oneview.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        oneview.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        oneview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        let heightConstraint = oneview.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 25)
        heightConstraint.isActive = true
        heightConstraint.priority = .defaultLow
        
        for i in 1...30{
            let field = UITextField()
            field.placeholder = "This is line "+String(i+1)
            field.backgroundColor = .gray
            field.isUserInteractionEnabled = false
            oneview.addArrangedSubview(field)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    deinit {
        print("deinit")
    }
}
