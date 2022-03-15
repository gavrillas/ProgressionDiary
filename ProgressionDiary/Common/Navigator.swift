import SwiftUI

protocol Navigator: ObservableObject {
    associatedtype Destination: View
    associatedtype DestinationType: Hashable, CaseIterable
    var state: DestinationType? { get set }
    @ViewBuilder var destination: Destination { get }
    var models: [DestinationType: Any] { get set }
}

extension Navigator {
    func inject<T>() -> T? {
        guard let state = state else { return nil }
        return models[state] as? T
    }

    func navigate<T>(to destination: DestinationType, model: T? = nil) {
        self.state = destination
        guard let model = model else { return }
        models[destination] = model
    }
}

extension View {
    func navigation<N: Navigator>(using navigator: ObservedObject<N>) -> some View where N.DestinationType.AllCases: RandomAccessCollection {
        overlay {
            ForEach(N.DestinationType.allCases, id: \.self) { state in
                NavigationLink(tag: state,
                               selection: navigator.projectedValue.state,
                               destination: { navigator.wrappedValue.destination },
                               label: { EmptyView() })
            }.hidden()
        }
    }
}
