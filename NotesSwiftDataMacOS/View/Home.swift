//
//  Home.swift
//  NotesSwiftDataMacOS
//
//  Created by Volodymyr Pysarenko on 18.06.2024.
//

import SwiftUI

struct Home: View {
    
    @State private var selectedTag: String?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedTag) {
                Text("Add notes")
            }
        } detail: {
            Text("Select an item")
        }

    }
}

#Preview {
    ContentView()
}
