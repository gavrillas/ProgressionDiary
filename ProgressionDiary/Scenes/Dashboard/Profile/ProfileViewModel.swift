import Foundation
import Combine

protocol ProfileViewModelUseCase {
    var state: ProfileViewState { get }

    func rightBarButtonDidTap()
}

class ProfileViewModel: ProfileViewModelUseCase {
    let state: ProfileViewState
    let authSerivce: AuthServiceUseCase

    private var subscriptions = Set<AnyCancellable>()

    init(with state: ProfileViewState, authService: AuthServiceUseCase) {
        self.state = state
        self.authSerivce = authService
    }

    func rightBarButtonDidTap() {
    }
}
