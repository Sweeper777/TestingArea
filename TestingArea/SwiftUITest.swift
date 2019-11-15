import SwiftUI
import SCLAlertView
import Combine

struct SwiftUITest: View {
    
    @State var interval = 1

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker.init("Every", selection: $interval) {
                        ForEach(1 ..< 1000) { weeks in
                            Text("\(weeks) week\(weeks == 1 ? "" : "s")")
                                .tag(weeks)
                        }
                        }.pickerStyle(WheelPickerStyle())
                }
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
}
