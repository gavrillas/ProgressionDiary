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
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var selectedSegment: SegmentState = .login

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
            Spacer()
            Picker(state.selectedSegment.title, selection: $state.selectedSegment) {
                ForEach(state.segmentedOptions, id: \.self) {
                    Text($0.title).tag($0)
                }
            }.pickerStyle(.segmented)
                .padding()
            TextField(state.emailTitle, text: $state.email)
                .padding()
            TextField(state.paswordTitle, text: $state.password)
                .padding()
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
