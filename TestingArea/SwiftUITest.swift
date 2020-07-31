import SwiftUI
import Combine


import SwiftUI

struct ContentView: View {
    @State var text = "你好世界"
    
     var body: some View {
        NavigationView() {
            Text("Hello")
                .navigationBarTitle("Hello")
                .navigationBarItems(trailing: Button(action: { }) {
                    Text("Hello").foregroundColor(.red)
                })
        }.onAppear {
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.configureWithTransparentBackground()
            UINavigationBar.appearance().standardAppearance = standardAppearance
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

extension Collection {
    
    func chunked(by distance: Int) -> [[Element]] {
        precondition(distance > 0, "distance must be greater than 0") // prevents infinite loop

        var index = startIndex
        let iterator: AnyIterator<Array<Element>> = AnyIterator({
            let newIndex = self.index(index, offsetBy: distance, limitedBy: self.endIndex) ?? self.endIndex
            defer { index = newIndex }
            let range = index ..< newIndex
            return index != self.endIndex ? Array(self[range]) : nil
        })
        
        return Array(iterator)
    }
    
}
