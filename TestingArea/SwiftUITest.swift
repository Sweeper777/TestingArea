import SwiftUI
import SCLAlertView

struct SwiftUITest: View {
    
    var body: some View {
//        NavigationView {
            List {
                ForEach(0...10) {
                    number in
                    Text("\(number)")
                }
            }
//            .navigationBarTitle("Welcome!")
//        }
    }
}

extension Int : Identifiable {
    
    public typealias ID = Int
    public var id: Int { return self }
    
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
