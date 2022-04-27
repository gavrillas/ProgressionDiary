import Foundation
import Combine

protocol ProfileViewModelUseCase {
    var state: ProfileViewState { get }

    func rightBarButtonDidTap()
}

class ProfileViewModel: ProfileViewModelUseCase {
    let state: ProfileViewState
    let authSerivce: AuthServiceUseCase
    let firestoreService: FirestoreServiceUseCase

    private var subscriptions = Set<AnyCancellable>()

    init(with state: ProfileViewState, authService: AuthServiceUseCase, firestoreService: FirestoreServiceUseCase) {
        self.state = state
        self.authSerivce = authService
        self.firestoreService = firestoreService
        
        localize()
    }

    func rightBarButtonDidTap() {
        state.isLoading = true
        authSerivce.signOut().sink { _ in
            return
        } receiveValue: { [weak self] _ in
            self?.state.isLoading = false
        }.store(in: &subscriptions)
    }

    private func localize() {
        state.rightBarButtonTitle = Txt.Profile.Navbar.logout
    }
}
