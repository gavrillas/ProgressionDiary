import SwiftUI

struct AppView<ViewModel: AppViewModelUseCase,
                                       N>: View where N == ViewModel.N, N.DestinationType.AllCases: RandomAccessCollection {
    let viewModel: ViewModel
    @ObservedObject var navigator: N

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.navigator = viewModel.navigator
    }

    var body: some View {
        navigator.destination
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        let navigator = AppNavigator()
        let viewModel = AppViewModel(with: navigator, authService: AuthService())
        AppView(viewModel: viewModel)
    }
}
