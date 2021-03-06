// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Txt {

  internal enum Authentication {
    /// Email cím:
    internal static let email = Txt.tr("Localizable", "authentication.email")
    /// Bejelentkezés
    internal static let login = Txt.tr("Localizable", "authentication.login")
    /// Jelszó
    internal static let password = Txt.tr("Localizable", "authentication.password")
    /// Regisztráció
    internal static let register = Txt.tr("Localizable", "authentication.register")
  }

  internal enum General {
    /// Ok
    internal static let ok = Txt.tr("Localizable", "general.ok")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Txt {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
