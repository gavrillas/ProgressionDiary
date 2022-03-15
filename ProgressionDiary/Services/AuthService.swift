import Combine
import FirebaseAuth
import SwiftUI

enum AuthServiceError: Error {
    case noInternet
    case unkown
}

enum UserState {
    case loggedIn
    case loggedOut
}

//sourcery: AutoMockable
protocol AuthServiceUseCase {
    var currentUserState: UserState { get }
    var userStateChangePublisher: AnyPublisher<UserState, Never> { get }
    func register(with email: String, password: String) -> AnyPublisher<Void, AuthServiceError>
    func signIn(with email: String, password: String) -> AnyPublisher<Void, AuthServiceError>
    func signOut() -> AnyPublisher<Void, AuthServiceError>
}

class AuthService {
    private let userStateSubject = PassthroughSubject<UserState, Never>()
    private var authStateHandler: AuthStateDidChangeListenerHandle?

    private func handleAuth(error: Error?, promise: (Result<Void, AuthServiceError>) -> Void) {
        if let error = error {
            let errorValue: AuthServiceError = error.isNoInternetError ? .noInternet : .unkown
            promise(.failure(errorValue))
            return
        }
        promise(.success(()))
    }

    deinit {
        guard let authStateHandler = authStateHandler else { return }
        Auth.auth().removeStateDidChangeListener(authStateHandler)
    }
}

extension AuthService: AuthServiceUseCase {
    var currentUserState: UserState {
        Auth.auth().currentUser == nil ? .loggedOut : .loggedIn
    }

    var userStateChangePublisher: AnyPublisher<UserState, Never> {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
                let userState: UserState = user == nil ? .loggedOut : .loggedIn
                self?.userStateSubject.send(userState)
            }
        }
        return userStateSubject.eraseToAnyPublisher()
    }

    func register(with email: String, password: String) -> AnyPublisher<Void, AuthServiceError> {
        Future<Void, AuthServiceError> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
                guard let self = self else { return }
                self.handleAuth(error: error, promise: promise)
            }
        }.eraseToAnyPublisher()
    }

    func signIn(with email: String, password: String) -> AnyPublisher<Void, AuthServiceError> {
        Future<Void, AuthServiceError> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
                guard let self = self else { return }
                self.handleAuth(error: error, promise: promise)
            }
        }.eraseToAnyPublisher()
    }

    func signOut() -> AnyPublisher<Void, AuthServiceError> {
        Future<Void, AuthServiceError> { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                let errorValue: AuthServiceError = error.isNoInternetError ? .noInternet : .unkown
                promise(.failure(errorValue))
            }
        }.eraseToAnyPublisher()
    }

}
