import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        Text(viewModel.content).onAppear() {
            self.viewModel.subsribe()
        }
    }
}
class ViewModel: ObservableObject {

    @Published var content: String = ""
    var subscription: AnyCancellable?
    private let model = Model()

    func subsribe() {
        subscription = model.getPublisher().sink { value in
            self.content = value
        }
    }
}

struct Model {

    func getPublisher() -> AnyPublisher<String, Never> {
        Just("Test")
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class MyHostingController: UIHostingController<ContentView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentView())
        
    }
}
