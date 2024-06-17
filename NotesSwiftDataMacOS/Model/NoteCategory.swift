//
//  NoteCategory.swift
//  NotesSwiftDataMacOS
//
//  Created by Volodymyr Pysarenko on 18.06.2024.
//

import SwiftUI
import SwiftData

@Model
final class NoteCategory {
    var categoryTitle: String
    //Relationship
    @Relationship(deleteRule: .cascade, inverse: \Note.category)
    var notes: [Note]?
    
    init(categoryTitle: String) {
        self.categoryTitle = categoryTitle
    }
}
