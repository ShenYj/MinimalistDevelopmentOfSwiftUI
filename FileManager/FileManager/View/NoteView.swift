//
//  NoteView.swift
//  FileManager
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct NoteView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            if viewModel.sentenceModel.isEmpty {
                emptyImageView
            }
            else {
                noteCardList
            }
        }
    }
    
    private var noteCardList: some View {
        ScrollView {
            ForEach(viewModel.sentenceModel) { item in
                NoteCard(sentence: item.sentence, create_time: item.create_time)
                    .contextMenu {
                        Button("删除") {
                            viewModel.deleteNote(id: item.id)
                        }
                    }
            }
        }
    }
    
    private var emptyImageView: some View {
        Image("empty")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
    }
}

#Preview {
    NoteView()
        .environmentObject(ViewModel())
}
