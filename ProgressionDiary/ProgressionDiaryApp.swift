//
//  ProgressionDiaryApp.swift
//  ProgressionDiary
//
//  Created by kristof on 2022. 03. 14..
//

import SwiftUI

@main
struct ProgressionDiaryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
