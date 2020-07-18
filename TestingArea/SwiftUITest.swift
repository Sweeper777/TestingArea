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
