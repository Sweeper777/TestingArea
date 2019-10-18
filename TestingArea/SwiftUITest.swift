import SwiftUI

struct SwiftUITest: View {
    @State private var value1 = 0.0
    @State private var value2 = 0.0
    @State private var value3 = 0.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 70) {
            Text(verbatim: "\(count)")
            Button(action: { self.count += 1 }) {
                Text("Press Me!")
                    .foregroundColor(.red)
                    .font(Font.custom("Chalkboard SE", size: 30))
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
