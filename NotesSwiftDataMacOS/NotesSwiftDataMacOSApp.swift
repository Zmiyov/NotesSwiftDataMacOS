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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 300, minHeight: 400)
        }
        .windowResizability(.contentSize)
        .modelContainer(for: [Note.self, NoteCategory.self])
    }
}
