//
//  GoalViewModel.swift
//  GoalLife
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI
import CoreData

class GoalViewModel: ObservableObject {
    
    @Published var goals: [Goal] = []
    
    /// 加载数据
    func fetchData() {
        let context = Persistence.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Goal> = Goal.fetchRequest()
        
        do {
            goals = try context.fetch(fetchRequest)
        }
        catch {
            print("Faild to fetch goals: \(error.localizedDescription)")
        }
    }
    
    /// 新增目标
    func add(GoalText goalText: String, targetDate: Date) {
        let context = Persistence.shared.container.viewContext
        let newGoal = Goal(context: context)
        newGoal.id = UUID()
        newGoal.goalText = goalText
        newGoal.targetDate = targetDate
        newGoal.currentProgress = 0
        do {
            try context.save()
            fetchData()
        }
        catch {
            print("Faild to save goal: \(error.localizedDescription)")
        }
    }
}
