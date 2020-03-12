import UIKit

class MyViewController: UIViewController{

    override func viewDidLoad() {
        let myText = UITextView()
        view.addSubview(myText)
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.textAlignment = .center
        myText.backgroundColor = .gray
        NSLayoutConstraint.activate([
          myText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          myText.topAnchor.constraint(equalTo: view.topAnchor),
          myText.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          myText.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        myText.attributedText = NSAttributedString(string: "Hello World", attributes: [.foregroundColor: UIColor(named: "myColor")!])
    }

    @objc func f(_ c: @escaping (Status) -> Void) {}
}

@objc public enum Status : Int {
    case unknown;
    case ok;
    case failed;
    
}

