//
//  ContentView.swift
//  Note
//
//  Created by EZen on 2025/04/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notes = Note.notes
    
    @State private var showNewNoteViewObservable: Bool = false
    
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            VStack {
                noteTitleView
                noteListView
            }
            addNoteBtn
        }
        .sheet(isPresented: $showNewNoteViewObservable) {
            print("弹层关闭")
        } content: {
            NewNoteView(showNewNoteViewObservable: $showNewNoteViewObservable, notes: $notes)
                .presentationDetents([.medium])
        }

    }
    
    /// 界面标题
    private var noteTitleView: some View {
        Text("Note笔记")
            .font(.title)
            .bold()
    }
    
    /// 笔记列表
    private var noteListView: some View {
        List($notes, editActions: .all) { $note in
            Text(note.noteContent)
        }
        .listStyle(.plain)
    }
    
    /// 新增按钮
    private var addNoteBtn: some View {
        Button {
            self.showNewNoteViewObservable.toggle()
        } label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 48))
                .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
