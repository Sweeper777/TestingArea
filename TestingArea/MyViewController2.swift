import UIKit
import DCTextEngine
import RxSwift
import RxCocoa

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    let disposeBag = DisposeBag()
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let engine = DCTextEngine.withMarkdown()!
        engine.addPattern("<title> \\w+") { (regex, text) -> DCTextOptions? in
            let options = DCTextOptions()
            options.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            options.replaceText = String(text?.dropFirst(8) ?? "")
            return options
        }
        let attributedString = engine.parse("<title> abc\nhello")
        print(attributedString?.attribute(.font, at: 0, effectiveRange: nil) ?? "nil")
        textview.attributedText = attributedString
    }
    
    
    @IBAction func click() {
    }
    
    @available(*, unavailable)
    @objc func foo() {}
}

class Timer {
    var paused = true
    {
        didSet {
            rxPaused.accept(paused)
        }
    }
    var ended = false
    
    let rxPaused = BehaviorRelay(value: true)
    let disposeBag = DisposeBag()
    var timerEvents: Observable<Int>!
    
    private var currentState: Int
    private let resetState: Int
    
    private init(currentState: Int, resetState: Int) {
        self.currentState = currentState
        self.resetState = resetState
        reset()
    }
    
    static func newCountDownInstance(countDownTime: Int) -> Timer {
        Timer(currentState: countDownTime,
              resetState: countDownTime)
    }
    
    func start() {
        if !ended {
            paused = false
        }
    }
    
    func pause() {
        paused = true
    }
    
    func reset() {
        ended = false
        currentState = resetState
        pause()
        timerEvents = rxPaused.asObservable()
            .flatMapLatest {  isRunning in
                isRunning ? .empty() : Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            }
            .enumerated().flatMap { (index, int) in Observable.just(index) }
        .map { [weak self] x in (self?.resetState ?? x) - x }
            .take(self.resetState)
        timerEvents.subscribe(onNext: { [weak self]
            timerEvent in
            self?.currentState -= 1
            }, onCompleted: {
                [weak self] in
                self?.ended = true
        }).disposed(by: disposeBag)
    }
}
