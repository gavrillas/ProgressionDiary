import Foundation
import Combine

protocol DashboardViewModelUseCase {
    associatedtype N: DashboardNavigatorUseCase
    var state: DashboardViewState { get }
    var navigator: N { get }

    func rightBarButtonDidTap()
}

class DashboardViewModel<N: DashboardNavigatorUseCase>: DashboardViewModelUseCase {
    let state: DashboardViewState
    let navigator: N

    private var subscriptions = Set<AnyCancellable>()

    init(with navigator: N, state: DashboardViewState) {
        self.navigator = navigator
        self.state = state
    }

    func rightBarButtonDidTap() {
        navigator.showProfile()
    }
}
