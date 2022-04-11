import SwiftUI

enum ScreenBackgroundStyle {
    case basic
    case singleColor(color: Color)
    case linearGradient(gradient: LinearGradient)
}

struct ScreenBackground: ViewModifier {
    let style: ScreenBackgroundStyle

  func body(content: Content) -> some View {
      ZStack {
          switch style {
          case .basic:
              LinearGradient(colors: [.purple, .indigo, .blue], startPoint: .top, endPoint: .bottom)
                  .ignoresSafeArea()
          case .singleColor(let color):
              color.ignoresSafeArea()
          case .linearGradient(gradient: let gradient):
              gradient.ignoresSafeArea()
          }
          content
      }
  }
}

extension View {
    func screenBackground(style: ScreenBackgroundStyle = .basic) -> some View {
        modifier(ScreenBackground(style: style))
    }
}
