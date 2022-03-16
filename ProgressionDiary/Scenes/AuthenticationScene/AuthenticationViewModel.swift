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

        bindButtonDisableState()
    }

    private var areFieldsValid: Bool {
        guard isEmailFormValid else { return false }
        guard !state.password.isEmpty else { return false }
        guard state.selectedSegment == .register else { return true }
        return state.password == state.passwordConfirm
    }

    private var isEmailFormValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: state.email)
    }

    func buttonDidTap() {
        state.isLoaing = true
        switch state.selectedSegment {
        case .login:
            signIn()
        case .register:
            register()
        }
    }

    private func signIn() {
        authService.signIn(with: state.email,
                           password: state.password)
            .sink { error in
                return
            } receiveValue: { [weak self] in
                self?.state.isLoaing = false
            }.store(in: &subscriptions)
    }

    private func register() {
        authService.register(with: state.email,
                             password: state.password)
            .sink { error in
                return
            } receiveValue: { [weak self]  in
                self?.state.isLoaing = false
            }.store(in: &subscriptions)
    }

    private func bindButtonDisableState() {
        Publishers.MergeMany([
            state.$email,
            state.$password,
            state.$passwordConfirm
        ])
            .map { [weak self] _ in
                !(self?.areFieldsValid ?? false)
            }
            .assign(to: \.isButtonDisabled, on: self.state)
            .store(in: &subscriptions)
    }
}
