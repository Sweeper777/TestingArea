import UIKit
import SCLAlertView
import RxSwift
import RxCocoa
import Stencil

class MyViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let usernameTextField = GFTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.addSubview(usernameTextField)

        NSLayoutConstraint.activate([
          usernameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
          usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
          usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
          usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    deinit {
        print("deinit")
    }
}

class GFTextField: UITextField {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
        
    layer.cornerRadius          = 10
    layer.borderWidth           = 2
    layer.borderColor           = UIColor.systemGray4.cgColor
        
    textColor                   = .label
    tintColor                   = .label
    textAlignment               = .center
    font                        = UIFont.preferredFont(forTextStyle: .title2)
    adjustsFontSizeToFitWidth   = true
    minimumFontSize             = 12
        
    backgroundColor             = .tertiarySystemBackground
    autocorrectionType          = .no
    placeholder                 = "Enter a username"
  }
}
