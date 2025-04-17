//
//  Note.swift
//  Note
//
//  Created by EZen on 2025/04/14.
//

import Foundation

struct Note: Identifiable {
    
    let id = UUID()
    var noteContent: String
    
}

extension Note {
    
    static var notes: [Note] {
        [
            Note(noteContent: "总要为了梦想, 权利衣服一次."),
            Note(noteContent: "为了梦想,一路狂奔."),
            Note(noteContent: "从现在开始努力,一切都还来得及."),
            Note(noteContent: "没有失败,只有暂时不成功.")
        ]
    }
}
