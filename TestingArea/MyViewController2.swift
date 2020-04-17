import UIKit
import DCTextEngine
import SwiftyJSON
import Combine

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    var cancellable : AnyCancellable!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "home")?.withTintColor(.link)

        let fullString = NSMutableAttributedString(string: "1: Press the ")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: " button"))
        textview.attributedText = fullString

        cancellable = Timer.publish(every: 0.2, on: .main, in: .common)
            .autoconnect()
        .b
            .buffer(Timer.publish(every: 2, on: .main, in: .common).autoconnect())
            .sink() { array in
                print ("timer fired: \(array.map { $0.timeIntervalSince1970 })")
        }
    }
    
    
    @IBAction func click() {
        let imageAttachment = NSTextAttachment(image: UIImage(named: "home")!)

        let fullString = NSMutableAttributedString(string: "2: Press the ")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: " button"))
        textview.attributedText = fullString
    }
    
    @available(*, unavailable)
    @objc func foo() {}
}

struct AnyObserver<Output, Failure: Error> {
    let onNext: ((Output) -> Void)
    let onError: ((Failure) -> Void)
    let onCompleted: (() -> Void)
}

struct Disposable {
    let dispose: () -> Void
}

extension AnyPublisher {
    static func create(subscribe: @escaping (AnyObserver<Output, Failure>) -> Disposable) -> Self {
        let subject = PassthroughSubject<Output, Failure>()
        var disposable: Disposable?
        return subject
            .handleEvents(receiveSubscription: { subscription in
                disposable = subscribe(AnyObserver(
                    onNext: { output in subject.send(output) },
                    onError: { failure in subject.send(completion: .failure(failure)) },
                    onCompleted: { subject.send(completion: .finished) }
                ))
            }, receiveCancel: { disposable?.dispose() })
            .eraseToAnyPublisher()
    }
}

extension Publisher {

    /// collects elements from the source sequence until the boundary sequence fires. Then it emits the elements as an array and begins collecting again.
    func buffer<T: Publisher, U>(_ boundary: T) -> AnyPublisher<[Output], Failure> where T.Output == U {
        return AnyPublisher.create { observer in
            var buffer: [Output] = []
            let lock = NSRecursiveLock()
            let boundaryDisposable = boundary.sink(receiveCompletion: {
                _ in
            }, receiveValue: {_ in
                lock.lock(); defer { lock.unlock() }
                observer.onNext(buffer)
                buffer = []
            })
            let disposable = self.sink(receiveCompletion: { (event) in
                lock.lock(); defer { lock.unlock() }
                switch event {
                case .finished:
                    observer.onNext(buffer)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                    buffer = []
                }
            }) { (element) in
                lock.lock(); defer { lock.unlock() }
                buffer.append(element)
            }
            return Disposable {
                disposable.cancel()
                boundaryDisposable.cancel()
            }
        }
    }
}
