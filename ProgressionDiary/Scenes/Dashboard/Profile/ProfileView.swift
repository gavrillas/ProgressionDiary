import SwiftUI

class ProfileViewState: ObservableObject {
    @Published var text: String = "This is your profile"
    @Published var isLoading = false
}

struct ProfileView<ViewModel: ProfileViewModelUseCase>: View {
    let viewModel: ViewModel
    @ObservedObject var state: ProfileViewState

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.state = viewModel.state
    }

    // TODO: - Create custom view modifier for loading
    var body: some View {
        Text(state.text)
            .toolbar {
                Button("logout") {
                    viewModel.rightBarButtonDidTap()
                }
            }.allowsHitTesting(!state.isLoading)
            .overlay() {
                if state.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProfileViewModel(with: ProfileViewState(), authService: AuthService())
        ProfileView(viewModel: viewModel)
    }
}
