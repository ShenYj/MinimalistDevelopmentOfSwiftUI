//
//  NewNoteView.swift
//  Note
//
//  Created by EZen on 2025/04/14.
//

import SwiftUI

struct NewNoteView: View {
    
    @State private var inputText: String = ""
    
    @Binding var showNewNoteViewObservable: Bool
    
    @Binding var notes: [Note]
    
    var body: some View {
        
        VStack(spacing: 20) {
            Spacer().frame(height: 5)
            HStack {
                closeBtnView
                Spacer()
                submitBtnView
            }
            .padding(.horizontal)
            inputTextView
            Spacer()
        }
    }
    
    /// 文本框
    private var inputTextView: some View {
        TextField("请输入", text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
    
    /// 关闭按钮
    private var closeBtnView: some View {
        Button {
            self.showNewNoteViewObservable.toggle()
        } label: {
            Image(systemName: "chevron.down.circle.fill")
                .font(.system(size: 28))
                .foregroundColor(Color(.systemGray3))
        }

    }
    
    /// 完成按钮
    private var submitBtnView: some View {
        Button {
            self.notes.append(Note(noteContent: inputText))
            self.showNewNoteViewObservable.toggle()
        } label: {
            Text("完成")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding(.all, 8)
                .background(.green)
                .cornerRadius(8)
        }

    }
}

#Preview {
    NewNoteView(showNewNoteViewObservable: .constant(false), notes: .constant([]))
}
