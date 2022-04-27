import Resolver

extension Resolver {
    static func registerServices() {
        Resolver.register(AuthServiceUseCase.self) {
            AuthService()
        }.scope(.cached)

        Resolver.register(FirestoreServiceUseCase.self) {
            FirestoreService()
        }
    }
}
