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

  internal enum Dashboard {
    internal enum Exercise {
      /// Adj hozzá új gyakorlatot
      internal static let description = Txt.tr("Localizable", "dashboard.exercise.description")
      /// Gyakorlatok
      internal static let title = Txt.tr("Localizable", "dashboard.exercise.title")
    }
    internal enum FoodDiary {
      /// Vezesd a saját táplálkozási naplódat
      internal static let description = Txt.tr("Localizable", "dashboard.food_diary.description")
      /// Étkezési napló
      internal static let title = Txt.tr("Localizable", "dashboard.food_diary.title")
    }
    internal enum Navbar {
      /// Menü
      internal static let title = Txt.tr("Localizable", "dashboard.navbar.title")
    }
    internal enum PhotoDiary {
      /// Dokumentáld fejlődésed fényképekkel
      internal static let description = Txt.tr("Localizable", "dashboard.photo_diary.description")
      /// Fénykép napló
      internal static let title = Txt.tr("Localizable", "dashboard.photo_diary.title")
    }
    internal enum Profil {
      /// Szerkeszd a profilod
      internal static let description = Txt.tr("Localizable", "dashboard.profil.description")
      /// Profil
      internal static let title = Txt.tr("Localizable", "dashboard.profil.title")
    }
    internal enum Training {
      /// Kezd el az edzést
      internal static let description = Txt.tr("Localizable", "dashboard.training.description")
      /// Edzés
      internal static let title = Txt.tr("Localizable", "dashboard.training.title")
    }
    internal enum TrainingDiary {
      /// Vezesd edzés naplódat
      internal static let description = Txt.tr("Localizable", "dashboard.training_diary.description")
      /// Edzés napló
      internal static let title = Txt.tr("Localizable", "dashboard.training_diary.title")
    }
    internal enum Vitamins {
      /// Emlékeztesd magad a vitamin bevitelre
      internal static let description = Txt.tr("Localizable", "dashboard.vitamins.description")
      /// Vitaminok
      internal static let title = Txt.tr("Localizable", "dashboard.vitamins.title")
    }
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
