import SwiftUI
import Combine


struct ContentView : View {

    var body: some View {
        Form{
            Section(header: Text("Sort")){
                List { ForEach(0...10, id: \.self) { item in
                    Text("\(item)")
                }
                .onMove(perform: {_, _ in}) }
            } // Sort Section
        } // Form
        .navigationBarItems(trailing:
               EditButton()
        )
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
