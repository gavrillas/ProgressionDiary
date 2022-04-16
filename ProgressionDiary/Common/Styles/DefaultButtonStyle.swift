import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    let textColor: Color
    let backgroundColor: Color
    @Environment(\.isEnabled) var isEnabled

    init(textColor: Color = .white, backgroundColor: Color = .indigoCustom) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .gray.opacity(0.5) : textColor)
            .background(isEnabled ? backgroundColor : backgroundColor.opacity(0.5))
            .cornerRadius(30)
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
