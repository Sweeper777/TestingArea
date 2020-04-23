import SwiftUI
import Combine
struct SomeItem: Identifiable { // identifiable item
    var id: Int // identity
}

struct ContentView : View {
    @State var text: String = "Hello"
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack {
            TextField("Placeholder", text: $text)
                .background(Color.white)
            Button(action: { self.isEditing = true }) {
                Text("Button")
            }
            }.padding().sheet(
            isPresented: self.$isEditing
        ) {
            Form {
                Text("Hello")
            }.scaleEffect(0.5)
        }
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
