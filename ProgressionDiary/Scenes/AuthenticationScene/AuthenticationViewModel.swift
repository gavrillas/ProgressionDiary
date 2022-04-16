import Foundation
import Combine

protocol AuthenticationViewModelUseCase {
    var state: AuthenticationViewState { get }

    func buttonDidTap()
    func alertButtonDidTap()
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

    func buttonDidTap() {
        state.isLoading = true
        authenticate()
            .mapError{ [weak self] authError in
                self?.mapError(authServiceError: authError) ?? .unkown
            }
            .sink { [weak self] completion in
                self?.handleError(completion: completion)
            } receiveValue: { [weak self] in
                self?.state.isLoading = false
            }.store(in: &subscriptions)
    }

    func alertButtonDidTap() {
        state.error = nil
    }

    private func authenticate() -> AnyPublisher<Void, AuthServiceError> {
        switch state.selectedSegment {
        case .login:
            return  authService.signIn(with: state.email,
                                       password: state.password)
        case .register:
            return authService.register(with: state.email,
                                 password: state.password)
        }
    }

    private func bindButtonDisableState() {
        state.$selectedSegment
            .combineLatest(state.$email,
                           state.$password,
                           state.$passwordConfirm)
            .map { [weak self] selectedSegment, email, password, passwordConfirm in
                !(self?.areFieldsValid(email: email,
                                       password: password,
                                       passwordConfirm: passwordConfirm,
                                       selectedSegment: selectedSegment) ?? false)
            }
            .assign(to: \.isButtonDisabled, on: self.state)
            .store(in: &subscriptions)
    }

    private func areFieldsValid(email: String,
                                password: String,
                                passwordConfirm: String,
                                selectedSegment: AuthenticationViewState.SegmentState) -> Bool {
        guard isEmailFormValid(email: email) else { return false }
        guard !password.isEmpty else { return false }
        guard selectedSegment == .register else { return true }
        return password == passwordConfirm
    }

    private func isEmailFormValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: state.email)
    }

    private func handleError(completion: Subscribers.Completion<AuthenticationViewState.AuthError>) {
        switch completion {
        case .failure(let error):
            state.isLoading = false
            state.error = error
        case .finished:
            return
        }
    }

    private func mapError(authServiceError: AuthServiceError) -> AuthenticationViewState.AuthError {
        switch authServiceError {
        case .noInternet:
            return .noInternet
        case .unkown:
            return .unkown
        }
    }
}
