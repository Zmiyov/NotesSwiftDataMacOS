//
//  NotesSwiftDataMacOSApp.swift
//  NotesSwiftDataMacOS
//
//  Created by Volodymyr Pysarenko on 18.06.2024.
//

import SwiftUI
import SwiftData

@main
struct NotesSwiftDataMacOSApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 300, minHeight: 400)
        }
        .windowResizability(.contentSize)
        .modelContainer(for: [Note.self, NoteCategory.self])
    }
}
