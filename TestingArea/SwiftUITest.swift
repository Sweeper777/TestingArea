import SwiftUI

struct SwiftUITest: View {
    @State private var count = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 70) {
            Text(verbatim: "\(count)")
            Button(action: { self.count += 1 }) {
                Text("Press Me!")
            }
        }
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
