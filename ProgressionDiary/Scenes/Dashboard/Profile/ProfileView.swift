import SwiftUI

class ProfileViewState: ObservableObject {
    @Published var text: String = "This is your profile"
    @Published var isLoading = false

    var rightBarButtonTitle: String = ""
}

struct ProfileView<ViewModel: ProfileViewModelUseCase>: View {
    let viewModel: ViewModel
    @ObservedObject var state: ProfileViewState

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.state = viewModel.state
    }

    var body: some View {
        Text(state.text)
            .toolbar {
                Button(state.rightBarButtonTitle) {
                    viewModel.rightBarButtonDidTap()
                }
            }
            .screenBackground()
            .isLoading(isLoading: state.isLoading)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProfileViewModel(with: ProfileViewState(), authService: AuthService())
        ProfileView(viewModel: viewModel)
    }
}
