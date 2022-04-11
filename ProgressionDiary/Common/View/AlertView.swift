import SwiftUI

struct AlertButtonPresentationModel: Identifiable {
    let text: String
    let action: () -> Void
    var id: String { text }
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
                    .foregroundColor(.white)
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
            .background(.cyan)
            .cornerRadius(12)
            .offset(x: 0, y: offsetY)
            .animation(.linear(duration: 1), value: offsetY)
            .frame(height: geometry.size.height, alignment: .bottom)
            .background(.black.opacity(0.6))
        }.onAppear() {
            offsetY = 10
        }
    }

    var alertButtons: some View {
        Group {
            ForEach(buttons) { buttonPM in
                Button(action: {
                    buttonPM.action()
                }) {
                    Text(buttonPM.text)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(.red)
                .cornerRadius(30)
            }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(text: "Ez egy hiba üzenet",
                  buttons: [.init(text: "Test1", action: {}),
                            .init(text: "Test2", action: {})],
                  buttonsOrientation: .horizontal)
    }
}
