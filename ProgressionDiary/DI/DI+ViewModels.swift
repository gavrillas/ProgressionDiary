import Resolver

extension Resolver {
    static func registerViewModels() {
        Resolver.register {
            AppViewModel<AppNavigator>(with: resolve(), authService: resolve())
        }

        Resolver.register { (_, args) in
            AuthenticationViewModel(with: args.get(), authService: resolve())
        }

        Resolver.register { (_, args) in
            DashboardViewModel<DashboardNavigator>(with: resolve(), state: args.get())
        }
    }
}
