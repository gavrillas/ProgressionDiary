//
//  ProgressionDiaryApp.swift
//  ProgressionDiary
//
//  Created by kristof on 2022. 03. 14..
//

import SwiftUI
import Firebase

@main
struct ProgressionDiaryApp: App {
    @StateObject var appNavigator = AppNavigator()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            appNavigator.destination
        }
    }
}
