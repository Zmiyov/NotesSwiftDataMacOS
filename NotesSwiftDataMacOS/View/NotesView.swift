//
//  NotesView.swift
//  NotesSwiftDataMacOS
//
//  Created by Volodymyr Pysarenko on 01.07.2024.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    var category: String?
    var allCategories: [NoteCategory]
    
    @Query private var notes: [Note]
    init(category: String?, allCategories: [NoteCategory]) {
        self.category = category
        self.allCategories = allCategories
        //Dynamic filtering
        let predicate = #Predicate<Note> {
            return $0.category?.categoryTitle == category
        }
        
        let favouritePredicate = #Predicate<Note> {
            return $0.isFavorite
        }
        
        let finalPredicate = category == "All Notes" ? nil : (category == "Favourites" ? favouritePredicate : predicate)
        
        _notes = Query(filter: finalPredicate, sort: [], animation: .snappy)
    }
    
    @FocusState private var isKeyboardEnabled: Bool
    @Environment(\.modelContext) private var context
    var body: some View {
        
        GeometryReader{
            let size = $0.size
            let width = size.width
            //Dynamic grid count based on the avalaible size
            let rowCount = max(Int(width / 250), 1)
            
            ScrollView(.vertical) {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: rowCount), spacing: 10) {
                    ForEach(notes) { note in
                        NoteCardView(note: note, isKeyboardnabled: $isKeyboardEnabled)
                            .contextMenu{
                                Button(note.isFavorite ? "Remove from Favourites" : "Move to Favourites") {
                                    note.isFavorite.toggle()
                                }
                                
                                Menu {
                                    ForEach(allCategories) { category in
                                        Button(action: {
                                            note.category = category
                                        }, label: {
                                            HStack(spacing: 5) {
                                                if category == note.category {
                                                    Image(systemName: "checkmark")
                                                        .font(.caption)
                                                }
                                            }
                                        })
                                    }
                                    
                                    Button("Remove from categories") {
                                        note.category = nil
                                    }
                                } label: {
                                    Text("Category")
                                }
                                
                                Button("Delete", role: .destructive) {
                                    context.delete(note)
                                }
                            }
                    }
                }
                .padding(12)
            }
            .onTapGesture {
                isKeyboardEnabled = false
            }
        }
    }
}

struct NoteCardView: View {
    @Bindable var note: Note
    var isKeyboardnabled: FocusState<Bool>.Binding
    @State private var showNote: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)
            if showNote {
                TextEditor(text: $note.content)
                    .focused(isKeyboardnabled)
                    .overlay(alignment: .leading){
                        Text("Finish Work")
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                            .opacity(note.content.isEmpty ? 1 : 0)
                            .allowsHitTesting(false)
                    }
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .padding(15)
                    .kerning(1.2)
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.15), in: .rect(cornerRadius: 12))
            }
        }
        .onAppear {
            showNote = true
        }
        .onDisappear {
            showNote = false
        }

    }
}

#Preview {
    ContentView()
}
