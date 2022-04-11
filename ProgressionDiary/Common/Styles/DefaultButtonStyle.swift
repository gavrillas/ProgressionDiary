import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    let textColor: Color
    let backgroundColor: Color

    init(textColor: Color = .white, backgroundColor: Color = .indigo) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .gray.opacity(0.5) : textColor)
            .background(backgroundColor)
            .cornerRadius(30)
            .padding(.horizontal, 10)
    }
}

struct DefaultButtonStyle_Preview: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Rendben")
        }
        .buttonStyle(DefaultButtonStyle())
    }
}
