import SwiftUI

struct ContentView: View {
    @State var count = 1
    var body: some View {
        VStack {
            CountView(count: $count)
            Text("My Count: \(count)")
            Button("Show My Count"){print("\(self.count)")}
        }
    }
}
struct CountView: View {
    @Binding var count: Int
    var body: some View {
        VStack {
            Button("Increase count"){self.count += 1}
            Text("Count = \(count)")
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
