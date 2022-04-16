import SwiftUI

extension Color {
    static let indigoCustom = Color(Asset.indigo.color)
}

extension ShapeStyle where Self == Color {
    static var indigoCustom: Color { Color.indigoCustom }
}
