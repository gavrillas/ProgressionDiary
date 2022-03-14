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

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
