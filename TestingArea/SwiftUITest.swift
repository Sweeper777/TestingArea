import SwiftUI
import Combine


struct DetailView: View {
    @State var value: Int = 10
    
    var body: some View {
        VStack {
            Text("not updating: \(value == 10 ? "looks like a ten" : "must be something else")")
            Button(action: { value = 9 }, label: {
                Text("Button")
            })
        }
    }
}

public struct SwiftUITest_Previews: PreviewProvider {
    public static var previews: some View {
        DetailView()
    }
}
