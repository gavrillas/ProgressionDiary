import SwiftUI

class AuthenticationViewState: ObservableObject {
    let title = Txt.Authentication.title
    let emailTitle = Txt.Authentication.email
    let paswordTitle = Txt.Authentication.password
    @Published var email: String = ""
    @Published var password: String = ""
}

struct AuthenticationView<ViewModel: AuthenticationViewModelUseCase>: View {
    let viewModel: ViewModel
    @ObservedObject var state: AuthenticationViewState

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.state = viewModel.state
    }

    var body: some View {
        HStack {
            Text(state.title)
            Spacer()
            TextField(state.emailTitle, text: $state.email)
            Spacer()
            TextField(state.paswordTitle, text: $state.password)
            Spacer()
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthenticationViewModel(with: AuthenticationViewState())
        AuthenticationView(viewModel: viewModel)
    }
}
