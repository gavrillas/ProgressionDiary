import Foundation
import Combine

protocol AuthenticationViewModelUseCase {
    var state: AuthenticationViewState { get }
}

class AuthenticationViewModel: AuthenticationViewModelUseCase {
    let state: AuthenticationViewState

    private var subscriptions = Set<AnyCancellable>()

    init(with state: AuthenticationViewState) {
        self.state = state
    }
}
