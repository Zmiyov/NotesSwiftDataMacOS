//
//  Item.swift
//  NotesSwiftDataMacOS
//
//  Created by Volodymyr Pysarenko on 18.06.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
