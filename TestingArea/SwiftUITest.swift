import SwiftUI
import Combine


struct DetailView: View {
    var title: String = ""
    var body: some View {
        Text("Hi!")
            .navigationBarTitle("", displayMode: .inline)
    }
}
