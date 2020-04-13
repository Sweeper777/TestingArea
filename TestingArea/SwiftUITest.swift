import SwiftUI
import Combine
struct SomeItem: Identifiable { // identifiable item
    var id: Int // identity
}

struct ContentView: View {

    @State private var selectedItem: SomeItem? = nil

    var body: some View {
        VStack {
            ScrollView (.vertical, showsIndicators: false) {
                ForEach (0..<5) { i in

                    Text("Item \(i)").padding()
                    .onTapGesture {
                        self.selectedItem = SomeItem(id: i)

                        // below simulate change identity while alert is shown
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                            self.selectedItem = nil                    // works !!

                             self.selectedItem?.id = 100             // crash !!
                            // self.selectedItem = SomeItem(id: 100)  // crash !!
                        }
                    }
                }
            }
        }
        .alert(item: self.$selectedItem) { item in
             Alert(title: Text("Alert"), message: Text("For item \(item.id)"), dismissButton: .default(Text("OK")))
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
