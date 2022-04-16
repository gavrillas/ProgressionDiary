import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .foregroundColor(.indigoCustom)
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(.indigoCustom, lineWidth: 2))
            .padding()
    }
}

struct DefaultTextFieldStyle_Preview: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        TextField("Email:", text: $text)
            .textFieldStyle(DefaultTextFieldStyle())
    }
}
