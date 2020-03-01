import UIKit

class MyViewController: UIViewController{

    override func viewDidLoad() {
        let myText = UITextView()
        myText.text = "Hello World!"
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
    }
}
