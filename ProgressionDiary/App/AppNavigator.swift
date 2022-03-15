import SwiftUI
import Combine
import Resolver

// sourcery: AutoMockable
// sourcery: typealias = "DestinationType = AppNavigator.NavigationState"
// sourcery: typealias = "Destination = EmptyView"
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
            let viewState: AuthenticationViewState = inject() ?? .init()
            AuthenticationView<AuthenticationViewModel>(viewModel: Resolver.resolve(args: viewState))
        case .dashboard:
            EmptyView()
        case .none:
            EmptyView()
        }
    }

    func showAuthentication() {
        let viewState = AuthenticationViewState()
        navigate(to: .auth, model: viewState)
    }

    func showDashboard() {
        
    }
}
