import SwiftUI

struct Word: Identifiable, Codable {
 var id: String
}

struct TestView: View {
  @State var isPresented = false
   var items: [Word] = [Word(id: "Test1"),
                     Word(id: "Test2"),
                     Word(id: "Test3")]
 var body: some View {
   NavigationView {
     List {
       ForEach(items) { word in
          Button(word.id) {
//            self.isPresented = true
          }
     }.sheet(isPresented: self.$isPresented) {
     SomeTestViewInsideTheSheet(action: {
         self.isPresented = false
       })
     .frame(minHeight: 0, maxHeight: 400, alignment: .center)
     }
   }
  
  .navigationBarTitle(Text("My Title"))
   }
  }
}

struct SomeTestViewInsideTheSheet: View {
   var action: ()->()
   var body: some View {
       VStack {
        Text("Test View")
        Button("Dismiss") {
            self.action()
        }
    }
  }
}


class MyHostingController: UIHostingController<TestView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: TestView())
        
    }
}
