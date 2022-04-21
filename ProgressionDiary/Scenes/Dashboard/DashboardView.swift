import SwiftUI

class DashboardViewState: ObservableObject {
    @Published var dashboardItems: [DashboardItemPresentationModel] = []
}

struct DashboardView<ViewModel: DashboardViewModelUseCase,
                                       N>: View where N == ViewModel.N, N.DestinationType.AllCases: RandomAccessCollection {
    let viewModel: ViewModel
    @ObservedObject var navigator: N
    @ObservedObject var state: DashboardViewState

    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.navigator = viewModel.navigator
        self.state = viewModel.state
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(state.dashboardItems, id: \.title) { item in
                        DashboardItemView(presentationModel: item)
                            .frame(height: UIScreen.main.bounds.width / 2.1)
                    }
                }.padding(.horizontal)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Dashboard")
            .foregroundColor(.indigoCustom)
            .screenBackground()
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
