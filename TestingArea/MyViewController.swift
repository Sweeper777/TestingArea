
import UIKit

open class CustomStackView: UIView {
    
    public var scrollView: UIScrollView = {
        
        let view = UIScrollView(frame: .zero)
        view.isScrollEnabled = true
        view.bounces = true
        view.alwaysBounceVertical = true
        view.keyboardDismissMode = .interactive
        view.layoutMargins = .zero
        view.clipsToBounds = false
        
        return view
    }()
    
    public var stackView: UIStackView = {
        
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        let gap: CGFloat = 0
        stackView.spacing = gap
        stackView.layoutMargins = UIEdgeInsets(top: gap, left: gap, bottom: gap, right: gap)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    override public init(frame: CGRect) {
        
        super.init(frame: frame)

        self.layoutMargins = .zero
        
        stackView.backgroundColor = .green
        
        let scrollableContentView = UIView(frame: .zero)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)

        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollableContentView)
        
        NSLayoutConstraint.activate([scrollableContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     scrollableContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     scrollableContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     scrollableContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     scrollableContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        let c = scrollableContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        c.priority = .defaultLow
        c.isActive = true
        
        scrollableContentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalTo: scrollableContentView.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: scrollableContentView.trailingAnchor),
//                                     stackView.topAnchor.constraint(lessThanOrEqualTo: scrollableContentView.topAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: scrollableContentView.bottomAnchor),
                                     stackView.widthAnchor.constraint(equalTo: scrollableContentView.widthAnchor)])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateScrollableContentSize() {
        if stackView.intrinsicContentSize.height <= stackView.bounds.height {
            scrollView.contentSize = scrollView.bounds.size
        } else {
            scrollView.contentSize = stackView.intrinsicContentSize
        }
    }
}

class CellView: UIView {
    
    private let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Title"
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "subTitle"
        label.isHidden = true
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }
    
    init(title: String) {
        
        super.init(frame: .zero)
        
        setupView()
        configureView(with: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setupView() {
        
    self.backgroundColor = .gray
        
        headerStackView.addArrangedSubview(title)
        headerStackView.addArrangedSubview(subTitle)
        addSubview(seperatorView)
        
        addSubview(headerStackView)
        
        setupConstraints()
    }
    
   private func setupConstraints() {
        
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        headerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        headerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        headerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        seperatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        seperatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func configureView(with title: String) {
        self.title.text = title
    }

}

class MyViewController: UIViewController {
    
    private let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        view.clipsToBounds = true
        return view
    }()
    
    private let customStackView: CustomStackView = {
        let view = CustomStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureView()
    }
    
    func setupView() {
        view.addSubview(containerView)
        containerView.clipsToBounds = true
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        containerView.addSubview(customStackView)

        NSLayoutConstraint.activate([
            customStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            customStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            customStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            customStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    func configureView() {
        customStackView.stackView.addArrangedSubview(CellView(title: "Title"))
        customStackView.stackView.addArrangedSubview(CellView(title: "Tesla"))
        customStackView.stackView.addArrangedSubview(CellView(title: "Lucid"))
        customStackView.stackView.addArrangedSubview(CellView(title: "Merc"))
        customStackView.stackView.addArrangedSubview(CellView(title: "BMW"))
        customStackView.updateScrollableContentSize()
    }
}
