//
//  ViewModel.swift
//  FileManager
//
//  Created by EZen on 2025/04/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var sentenceModel: [SentenceModel] = []
    
    init() {
        loadData()
    }
    
    private let dateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format
    }()
}

extension ViewModel {
    
    /// 添加笔记
    func addNote(sentence: String) {
        let newNote = SentenceModel(sentence: sentence, create_time: dateFormatter.string(from: Date()))
        sentenceModel.append(newNote)
        saveData()
    }
    
    func loadData() {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("sentenceModel.json")
            do {
                let data = try Data(contentsOf: fileURL)
                sentenceModel = try JSONDecoder().decode([SentenceModel].self, from: data)
            }
            catch {
                print("读取失败信息: \(error)")
            }
        }
    }
    
    func saveData() {
        do {
            let data = try JSONEncoder().encode(sentenceModel)
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent("sentenceModel.json")
                try data.write(to: fileURL)
            }
        }
        catch {
            print("保存信息失败: \(error)")
        }
    }
    
    func deleteNote(id: UUID) {
        if let index = sentenceModel.firstIndex(where: { $0.id == id }) {
            sentenceModel.remove(at: index)
            saveData()
        }
    }
}
