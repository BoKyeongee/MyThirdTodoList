//
//  TaskModel.swift
//  MyApp2
//
//  Created by 보경 on 2023/09/22.
//

import Foundation

struct Todo {
    var id: UUID
    var title: String
    var category: String
    var createDate: Date
    var modifyDate: Date?
    var isCompleted: Bool
}

struct TaskCategory {
    var id: UUID
    var title: String
    var emoji: String
}


