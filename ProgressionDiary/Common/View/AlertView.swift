import SwiftUI

struct AlertButtonPresentationModel: Identifiable {
    let text: String
    let action: () -> Void
    let textColor: Color
    let backgroundColor: Color
    var id: String { text }

    init(text: String,
         textColor: Color = .white,
         backgroundColor: Color = .indigoCustom,
         action: @escaping () -> Void) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
}

struct AlertView: View {
    enum ButtonsOrientation {
        case vertical, horizontal
    }

    @State var offsetY: CGFloat = UIScreen.main.bounds.height
    let text: String
    let buttons: [AlertButtonPresentationModel]
    let buttonsOrientation: ButtonsOrientation

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(text)
                    .foregroundColor(.indigoCustom)
                    .padding()
                switch buttonsOrientation {
                case .vertical:
                    VStack(spacing: 10) {
                        alertButtons
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 10)
                case .horizontal:
                    HStack(spacing: 10) {
                        alertButtons
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 10)
                }
            }
            .frame(width: geometry.size.width)
            //.background(.white)
            .cornerRadius(12)
            .offset(x: 0, y: offsetY)
            .animation(.linear(duration: 1), value: offsetY)
            .frame(height: geometry.size.height, alignment: .bottom)
            //.background(.black.opacity(0.6))
        }.onAppear() {
            offsetY = 10
        }
    }

    var alertButtons: some View {
        Group {
            ForEach(buttons) { buttonPM in
                Button(buttonPM.text) {
                    buttonPM.action()
                }
                .buttonStyle(DefaultButtonStyle(textColor: buttonPM.textColor,
                                                 backgroundColor: buttonPM.backgroundColor))
            }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(text: "Ez egy hiba üzenet",
                  buttons: [.init(text: "Test1") {},
                            .init(text: "Test2") {}],
                  buttonsOrientation: .horizontal)
    }
}
