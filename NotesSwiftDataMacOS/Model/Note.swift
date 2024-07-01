//
//  Note.swift
//  NotesSwiftDataMacOS
//
//  Created by Volodymyr Pysarenko on 18.06.2024.
//

import Foundation
import SwiftData

@Model
final class Note {
    var content: String
    var isFavorite: Bool = false
    var category: NoteCategory?
    
    init(content: String, category: NoteCategory) {
        self.content = content
        self.category = category
    }
}
