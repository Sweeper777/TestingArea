import SwiftUI

struct Word: Identifiable, Codable {
 var id: String
}

struct TestView: View {
 var body: some View {
   Text("Test")
  }
}


class MyHostingController: UIHostingController<TestView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: TestView())
        
    }
}
