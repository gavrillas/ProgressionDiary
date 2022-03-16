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
    
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    @Published var isLoaing = false
    @Published var selectedSegment: SegmentState = .login
    @Published var isButtonDisabled = true

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
                SecureField(state.paswordTitle, text: $state.password)
                    .padding()
            }
            Button(state.selectedSegment.title) {

            }.padding()
                .disabled(state.isButtonDisabled)
            Spacer()
        }.allowsHitTesting(!state.isLoaing)
        .overlay() {
            if state.isLoaing {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthenticationViewModel(with: AuthenticationViewState(), authService: AuthService())
        AuthenticationView(viewModel: viewModel)
    }
}
