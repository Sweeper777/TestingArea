import SwiftUI
import SCLAlertView
import Combine

struct SwiftUITest: View {
    
    @State var interval = 1

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
                Text("World")
            }
        }
        .onTapGesture {
            self.updateRruleString()
        }
    }

    public func updateRruleString() {
        
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
