//
//  SentenceModel.swift
//  FileManager
//
//  Created by EZen on 2025/04/21.
//

import Foundation

struct SentenceModel: Identifiable, Codable {
    var id: UUID = UUID()
    var sentence: String
    var create_time: String
}


