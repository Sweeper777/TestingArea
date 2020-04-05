import SwiftUI
import Combine
struct ContentView: View {

  @State var employees = ["Alex", "Olga", "Mark"]
  @State var presentEmployeeView = false

  var body: some View {
    NavigationView {
      List {
        Section {
          Button(action: {
            self.presentEmployeeView = true
          }, label: {
            Text("All employees")
          }).buttonStyle(BorderlessButtonStyle())
        }
      }
    }
    .sheet(isPresented: $presentEmployeeView) {
      EmployeesView(employees: self.employees).onDismiss {
        self.presentEmployeeView = false
      }
    }
  }
}

struct EmployeesView: View {
  let employees: [String]

  @State private var onDismissClosure: (() -> Void)? = nil
  func onDismiss(perform action: (() -> Void)? = nil) -> some View {
    self.onDismissClosure = action
    return self
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(employees, id: \.self) { employee in
          Text(employee)
        }
      }.navigationBarItems(leading:
        Button(action: {
          self.onDismissClosure?()
        }, label: {
          Text("Close")
       })
      )
    }
  }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class MyHostingController: UIHostingController<ContentView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentView())
        
    }
}
