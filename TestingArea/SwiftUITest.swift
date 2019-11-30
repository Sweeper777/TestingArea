import SwiftUI
import SCLAlertView
import Combine

struct SwiftUITest: View {
    
    @State var deck : String = "ABアイウエオCD"

    var body: some View {
        VStack {

            TextField("deck name", text: $deck)
                .font(Font.custom("Hiragino Maru Gothic ProN", size: 20))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .lineLimit(1)
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
