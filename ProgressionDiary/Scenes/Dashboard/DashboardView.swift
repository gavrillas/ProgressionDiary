import SwiftUI

class DashboardViewState: ObservableObject {
    @Published var text: String = "This is Dashboard"
}

struct DashboardView<ViewModel: DashboardViewModelUseCase,
                                       N>: View where N == ViewModel.N, N.DestinationType.AllCases: RandomAccessCollection {
    let viewModel: ViewModel
    @ObservedObject var navigator: N
    @ObservedObject var state: DashboardViewState

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.navigator = viewModel.navigator
        self.state = viewModel.state
    }

    var body: some View {
        NavigationView {
            Text(state.text)
                .toolbar {
                    Button("Profile") {
                        viewModel.rightBarButtonDidTap()
                    }
                }
                .navigation(using: _navigator)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let navigator = DashboardNavigator()
        let viewModel = DashboardViewModel(with: navigator, state: DashboardViewState())
        DashboardView(viewModel: viewModel)
    }
}
