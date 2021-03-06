import Resolver

extension Resolver {
    static func registerNavigators() {
        Resolver.register { AppNavigator() }
        Resolver.register { DashboardNavigator() }
    }
}
