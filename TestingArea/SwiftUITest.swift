import SwiftUI
import Combine


import SwiftUI

struct GradientView: View {
    @State private var angle: Double = 0
    var foreverAnimation: Animation {
            Animation.easeInOut(duration: 3)
            .repeatForever()
     }

    var body: some View {
        VStack(alignment: .leading){
            Button(action: {
                self.angle += 360
            }) {
                Text("Tap here")
                    .foregroundColor(.white)
                    .padding()
                    .rotationEffect(.degrees(angle))
                    .animation(.easeInOut)
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading)
        .background(
            AngularGradient(
                gradient: Gradient(colors:
                    [.red, .yellow,.green,.blue,.purple,.red]
                ),
                center: .center,
                startAngle: .degrees(self.angle),
                endAngle: .degrees(self.angle + 360)
            )
            .edgesIgnoringSafeArea(.all)
        )
        .animation(foreverAnimation)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}

class MyHostingController: UIHostingController<GradientView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: GradientView())
        
    }
}
