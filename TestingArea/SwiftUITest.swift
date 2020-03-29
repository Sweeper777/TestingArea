import SwiftUI

struct ContentView: View {
    @State var number: Double = 0
    
    let formatter : NumberFormatter = {
        let f = NumberFormatter()
        f.maximumFractionDigits = 0
        return f
    }()
    
    var body: some View {
        VStack {
            Infobox {
                Text("Hello, World!")
                
            }.border(Color.red)
            Infobox(withHeader: "Title") {
                Text("Hello, World!")
                
            }.border(Color.green)
            
        }
    }
}

struct Infobox<Content>: View where Content: View {

    let content: () -> Content
    let headerText: String

    var body: some View {
        VStack(alignment: .leading) {
            if !headerText.isEmpty {
                Text(headerText)
                    .font(.headline)
            }
            content()
        }
    }

    // note the optional parameter here
    init(withHeader headerText: String = "", @ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
        self.headerText = headerText
    }
}

class MyHostingController: UIHostingController<ContentView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentView())
        
    }
}
