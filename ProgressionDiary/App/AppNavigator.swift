import SwiftUI
import Combine
import Resolver

//sourcery: AutoMockable
//sourcery: typealias = "DestinationType = AppNavigator.NavigationState"
//sourcery: typealias = "Destination = EmptyView"
protocol AppNavigatorUseCase: Navigator {
    func showAuthentication()
    func showDashboard()
}

class AppNavigator: AppNavigatorUseCase {
    private var cancellables = Set<AnyCancellable>()

    var models: [NavigationState : Any] = [:]

    /// Destinations where the navigator can navigate.
    enum NavigationState: CaseIterable {
        case auth
        case dashboard
    }

    /// When it changes navigation happens.
    @Published var state: NavigationState?

    /// The destination where the navigation happens.
    var destination: some View {
        switch state {
        case .auth:
            // After the `navigate(to state:, model:)` is called
            // `inject()` will return the model which represents the sate of the view.
            // let viewState: ExampleState = inject() ?? .init()
            // ExampleView<ExampleViewModel, ExampleNavigator>(with: Resolver.resolve(args: viewState))
            EmptyView()
        case .dashboard:
            EmptyView()
        case .none:
            EmptyView()
        }
    }

    func showAuthentication() {
        
    }

    func showDashboard() {
        
    }
}
