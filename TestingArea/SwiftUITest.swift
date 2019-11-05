import SwiftUI
import SCLAlertView

struct SwiftUITest: View {
    
    var body: some View {
    }
}

final class MyObservableObject : ObservableObject {
    @Published var input = ""
    @Published var output: String = ""
    
    private var canc: AnyCancellable!
    
    init() {
        canc = $input
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { "You wrote \"\($0)\"" }
            .sink { self.output = $0 }
    }
    
    deinit {
        canc.cancel()
    }
}

struct SwiftUITest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITest()
    }
}


class MyHostingController: UIHostingController<SwiftUITest> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUITest())
        
    }
}
