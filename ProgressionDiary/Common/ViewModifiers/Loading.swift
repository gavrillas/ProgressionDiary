import SwiftUI

struct Loading: ViewModifier {
    let isLoading: Bool

    func body(content: Content) -> some View {
        if isLoading {
            content
                .allowsHitTesting(!isLoading)
                .overlay(ProgressView()
                    .progressViewStyle(.circular),
                         alignment: .center)
        } else {
            content
        }
    }
}

extension View {
    func isLoading(isLoading: Bool) -> some View {
        modifier(Loading(isLoading: isLoading))
    }
}
