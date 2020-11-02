import SwiftUI
import Combine

struct WeekDay {
    var dayOfTheWeek: String
    var numberOfTheDay: String
    var isActual: Bool = false
    var isBeforeActual: Bool = false
    var isAllCompleted: Bool = false
    var isLeftConnected: Bool = false
    var isRightConnected: Bool = false
}

struct ContentView: View {
    
    var week: [WeekDay] = [
        WeekDay(dayOfTheWeek: "PO", numberOfTheDay: "10", isBeforeActual: true, isAllCompleted: true, isLeftConnected: false, isRightConnected: true),
        WeekDay(dayOfTheWeek: "ÚT", numberOfTheDay: "11", isBeforeActual: true, isAllCompleted: true, isLeftConnected: true, isRightConnected: true),
        WeekDay(dayOfTheWeek: "ST", numberOfTheDay: "12", isBeforeActual: true, isAllCompleted: true, isLeftConnected: true, isRightConnected: false),
        WeekDay(dayOfTheWeek: "ČT", numberOfTheDay: "13", isBeforeActual: true, isAllCompleted: false, isLeftConnected: false, isRightConnected: true),
        WeekDay(dayOfTheWeek: "PÁ", numberOfTheDay: "14", isBeforeActual: true, isAllCompleted: false, isLeftConnected: true, isRightConnected: false),
        WeekDay(dayOfTheWeek: "SO", numberOfTheDay: "15", isActual: true, isBeforeActual: false ),
        WeekDay(dayOfTheWeek: "NE", numberOfTheDay: "16", isBeforeActual: false, isAllCompleted: false, isLeftConnected: false, isRightConnected: false),
    ]

    var body: some View {
        HStack(spacing: 0.0) {
            ForEach(week, id: \.dayOfTheWeek) { weekDay in
                
                    Button(action: {
                    }, label: {
                        VStack {
                            Text(weekDay.dayOfTheWeek)
                                .font(.system(size: 12))
                                .foregroundColor(weekDay.isActual ? Color.white : Color.gray)
                            Text(weekDay.numberOfTheDay)
                                .font(.system(size:18))
                                .fontWeight(.bold)
                                .foregroundColor(weekDay.isActual ? Color.white : Color.black)
                        }
                        .padding(8)
                    })
                    .background(
                            weekDay.isActual
                                    ? Color.purple
                                    : weekDay.isBeforeActual
                                    ? weekDay.isAllCompleted ? Color.green : Color.red
                                    : Color.white
                    )
                    .cornerRadius(
                            radius: 10.0,
                            corners: !weekDay.isLeftConnected && !weekDay.isRightConnected
                                    ? [.topLeft, .bottomLeft, .topRight, .bottomRight]
                                    : weekDay.isLeftConnected && weekDay.isRightConnected
                                    ? []
                                    : !weekDay.isLeftConnected
                                    ? [.topLeft, .bottomLeft]
                                    : [.topRight, .bottomRight]
                    )
                
            }
        }
    }

}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
