import SwiftUI
import Combine


import SwiftUI

struct ContentView: View {
    @State private var model = (0...20).map(\.description)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Text 1")
            Text("Text 2")
            Text("Text 3")
            Text("Text 4")

            List {
                ForEach(self.model, id: \.description) { fooItem in
                   Text(fooItem)
                }
            }

            Text("Want to pin this to the bottom")
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
