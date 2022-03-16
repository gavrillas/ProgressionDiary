import SwiftUI
import Combine
import Resolver

// sourcery: AutoMockable
// sourcery: typealias = "DestinationType = DashboardNavigator.NavigationState"
// sourcery: typealias = "Destination = EmptyView"
protocol DashboardNavigatorUseCase: Navigator {
    func showProfile()
}

class DashboardNavigator: DashboardNavigatorUseCase {
    private var cancellables = Set<AnyCancellable>()

    var models: [NavigationState : Any] = [:]

    /// Destinations where the navigator can navigate.
    enum NavigationState: CaseIterable {
        case profile
    }

    /// When it changes navigation happens.
    @Published var state: NavigationState?

    /// The destination where the navigation happens.
    var destination: some View {
        switch state {
        case .profile:
            // After the `navigate(to state:, model:)` is called
            // `inject()` will return the model which represents the sate of the view.
            // let viewState: ExampleState = inject() ?? .init()
            // ExampleView<ExampleViewModel, ExampleNavigator>(with: Resolver.resolve(args: viewState))
            EmptyView()
        case .none:
            EmptyView()
        }
    }

    func showProfile() {
        // Init viewState, update it with passed parameter and invoke navigate
        // let viewState = ExampleViewState()
        // viewState.text = text

        // navigate(to: .example, model: viewState)
    }
}
