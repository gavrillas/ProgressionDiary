import SwiftUI

class AuthenticationViewState: ObservableObject {
    enum SegmentState {
        case login
        case register

        var title: String {
            switch self {
            case .login:
                return Txt.Authentication.login
            case .register:
                return Txt.Authentication.register
            }
        }
    }

    enum AuthError: Error {
        case noInternet, unkown

        var localizedDescription: String {
            switch self {
            case .noInternet:
                return "There is no internet connection."
            case .unkown:
                return "Ooops! Something went wrong."
            }
        }
    }
    
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    @Published var isLoading = false
    @Published var selectedSegment: SegmentState = .login
    @Published var isButtonDisabled = true
    @Published var error: AuthError?

    let emailTitle = Txt.Authentication.email
    let paswordTitle = Txt.Authentication.password
    let segmentedOptions: [SegmentState] = [.login, .register]
}

struct AuthenticationView<ViewModel: AuthenticationViewModelUseCase>: View {
    let viewModel: ViewModel
    @ObservedObject var state: AuthenticationViewState

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.state = viewModel.state
    }

    var body: some View {
        VStack {
            Picker(state.selectedSegment.title, selection: $state.selectedSegment) {
                ForEach(state.segmentedOptions, id: \.self) {
                    Text($0.title).tag($0)
                }
            }.pickerStyle(.segmented)
                .padding()
            TextField(state.emailTitle, text: $state.email)
                .padding()
            SecureField(state.paswordTitle, text: $state.password)
                .padding()
            if state.selectedSegment == .register {
                SecureField(state.paswordTitle, text: $state.passwordConfirm)
                    .padding()
            }
            Button(state.selectedSegment.title) {
                viewModel.buttonDidTap()
            }.padding()
                .disabled(state.isButtonDisabled)
            Spacer()
        }
        .screenBackground()
        .isLoading(isLoading: state.isLoading)
        .overlay {
            state.error.map { AlertView(text: $0.localizedDescription,
                                        buttons: [.init(text: "Rendben", action: { viewModel.alertButtonDidTap() })],
                                        buttonsOrientation: .vertical)}
        }.animation(.linear, value: state.error)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthenticationViewModel(with: AuthenticationViewState(), authService: AuthService())
        AuthenticationView(viewModel: viewModel)
    }
}
