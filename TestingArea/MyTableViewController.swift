import UIKit
import Combine

class MyTableViewController: UIViewController {

    var cancelble = Set<AnyCancellable>()
    let publisher = PassthroughSubject<Date,Never>()
    lazy var delayPublisher = publisher.delay(for: .seconds(0.5), scheduler: DispatchQueue.main)
    override func viewDidLoad() {


        //let timerPublisher = Timer
        //    .publish(every: 1.0, on: RunLoop.main, in: .common)
        //    .autoconnect()
        //    .subscribe(publisher)

        
        delayPublisher
            .sink { (date) in
                print("delay publisher value :\(date)")
        }.store(in: &cancelble)

        publisher
            .sink { (value) in
                print("publisher value :\(value)")
        }.store(in: &cancelble)




        publisher.send(Date())
    }
}

