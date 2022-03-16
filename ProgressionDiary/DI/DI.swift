import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerServices()
        registerNavigators()
        registerViewModels()
    }
}
