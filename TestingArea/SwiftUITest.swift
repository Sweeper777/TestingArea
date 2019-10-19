import SwiftUI

struct SwiftUITest: View {
    @State private var value1 = 0.0
    @State private var value2 = 0.0
    @State private var value3 = 0.0
    
    var body: some View {
        VStack {
            Text("Total: \(value1 + value2 + value3)").font(Font.system(.largeTitle))
            Spacer()
            Slider(value: $value1, minimumValueLabel: Text("Min"), maximumValueLabel: Text("Max")) {
                Text("Value 1")
            }
            Slider(value: $value2, minimumValueLabel: Text("Min"), maximumValueLabel: Text("Max")) {
                Text("Value 2")
            }
            Slider(value: $value3, minimumValueLabel: Text("Min"), maximumValueLabel: Text("Max")) {
                Text("Value 3")
            }
        }.padding(20)
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
