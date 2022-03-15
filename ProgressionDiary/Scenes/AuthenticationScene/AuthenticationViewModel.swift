import Foundation
import Combine

protocol AuthenticationViewModelUseCase {
    var state: AuthenticationViewState { get }

    func buttonDidTap()
}

class AuthenticationViewModel: AuthenticationViewModelUseCase {
    let state: AuthenticationViewState
    let authService: AuthServiceUseCase

    private var subscriptions = Set<AnyCancellable>()

    init(with state: AuthenticationViewState, authService: AuthServiceUseCase) {
        self.state = state
        self.authService = authService
    }

    func buttonDidTap() {
        switch state.selectedSegment {
        case .login:
            signIn()
        default: break
        }
    }

    private func signIn() {
        state.isLoaing = true
        authService.signIn(with: state.email,
                           password: state.password)
            .sink(receiveCompletion: { error in
                return
            }, receiveValue: { [weak self] _ in
                self?.state.isLoaing = false
            }).store(in: &subscriptions)
    }
}
