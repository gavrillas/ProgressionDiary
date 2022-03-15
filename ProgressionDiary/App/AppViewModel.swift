import Foundation
import Combine

protocol AppViewModelUseCase {
    associatedtype N: AppNavigatorUseCase
    var navigator: N { get }
}

class AppViewModel<N: AppNavigatorUseCase>: AppViewModelUseCase {
    private let authService: AuthServiceUseCase
    let navigator: N

    private var subscriptions = Set<AnyCancellable>()

    init(with navigator: N, authService: AuthServiceUseCase) {
        self.navigator = navigator
        self.authService = authService

        navigateToProperScreen(for: authService.currentUserState)
        bindUserState()
    }

    private func bindUserState() {
        authService.userStateChangePublisher.sink { [weak self] userState in
            self?.navigateToProperScreen(for: userState)
        }.store(in: &subscriptions)
    }

    private func navigateToProperScreen(for userState: UserState) {
        switch userState {
        case .loggedIn:
            navigator.showDashboard()
        case .loggedOut:
            navigator.showAuthentication()
        }
    }
}
