import UIKit

class DMSLongLatInputView : UIView {
    private var degreeTextField: DMSLongLatTextField!
    private var minuteTextField: DMSLongLatTextField!
    private var secondTextField: DMSLongLatTextField!
    var signSelector: UISegmentedControl!
    let fontSize: CGFloat = 22
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        degreeTextField = DMSLongLatTextField()
        minuteTextField = DMSLongLatTextField()
        secondTextField = DMSLongLatTextField()
        signSelector = UISegmentedControl(items: ["N", "S"])
        signSelector.selectedSegmentIndex = 0
        signSelector.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: fontSize)], for: .normal)
        [degreeTextField, minuteTextField, secondTextField].forEach { (tf) in
            tf?.font = UIFont.monospacedDigitSystemFont(ofSize: fontSize, weight: .regular)
        }
        let degreeLabel = UILabel()
        degreeLabel.text = "°"
        let minuteLabel = UILabel()
        minuteLabel.text = "′"
        let secondLabel = UILabel()
        secondLabel.text = "″"
        [degreeLabel, minuteLabel, secondLabel].forEach {
            l in l.font = UIFont.systemFont(ofSize: fontSize)
        }
        let stackView = UIStackView(arrangedSubviews:
            [degreeTextField,
             degreeLabel,
             minuteTextField,
             minuteLabel,
             secondTextField,
             secondLabel,
             signSelector
        ])
        stackView.arrangedSubviews.forEach { (v) in
            v.setContentCompressionResistancePriority(.required, for: .horizontal)
            v.setContentHuggingPriority(.required, for: .horizontal)
        }
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
}

fileprivate class DMSLongLatTextField: UITextField, UITextFieldDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .tertiarySystemFill
        placeholder = "00"
        borderStyle = .none
        textAlignment = .right
    }
}
