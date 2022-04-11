import SwiftUI

struct Loading: ViewModifier {
  let isLoading: Bool

  func body(content: Content) -> some View {
      content
          .allowsHitTesting(!isLoading)
          .overlay() {
              if isLoading {
                  ProgressView()
                      .progressViewStyle(.circular)
              }
          }
  }
}

extension View {
    func isLoading(isLoading: Bool) -> some View {
        modifier(Loading(isLoading: isLoading))
    }
}
