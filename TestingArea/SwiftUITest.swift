import SwiftUI
import SCLAlertView

struct SwiftUITest: View {
    @State private var value1 = 0.0
    @State private var value2 = 0.0
    @State private var value3 = 0.0
    
    var body: some View {
        VStack {
            Text("Total: \(value1 + value2 + value3)").font(Font.system(.largeTitle))
                .gesture(
                    RotationGesture()
                        .onChanged(
                            { angle in
                                self.value1 = angle.degrees
                            }
                )
            )
            Image(systemName: "quote.bubble.fill")
            Spacer()
            Button(action: {
                let alert = SCLAlertView()
                _ = alert.addTextField()
                alert.showEdit("Foo")
            }) {
                Text("Press Me!")
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
