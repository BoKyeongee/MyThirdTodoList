//
//  File.swift
//  MyApp2
//
//  Created by 보경 on 2023/09/22.
//

import Foundation
import CoreData


class TaskViewModel {
    
    private var task: Task?  // CoreData Entity
    private var context: NSManagedObjectContext
    
    // Todo struct representation
    var todo: Todo {
        didSet {
            guard let task = task else { return }
            task.id = todo.id
            task.title = todo.title
            task.category = todo.category
            task.createDate = todo.createDate
            task.modifyDate = todo.modifyDate
            task.isCompleted = todo.isCompleted
        }
    }
    
    // CoreData context를 주입받아 초기화
    init(context: NSManagedObjectContext, todo: Todo) {
        self.context = context
        self.todo = todo
        self.task = Task(context: context)
    }
    
    init(managedTask: Task, context: NSManagedObjectContext) {
        self.task = managedTask
        self.context = context
        self.todo = Todo(
            id: managedTask.id ?? UUID(),
            title: managedTask.title ?? "",
            category: managedTask.category ?? "",
            createDate: managedTask.createDate ?? Date(),
            modifyDate: managedTask.modifyDate,
            isCompleted: managedTask.isCompleted
        )
    }
    
    // CoreData에서 Task를 가져오는 메소드
    func fetchTasks() -> [TaskViewModel] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
            do {
                let managedTasks = try context.fetch(request)
                print("Fetched tasks: \(managedTasks.count)")
                for task in managedTasks {
                    print("Task title: \(task.title ?? "No title")")
                }
                return managedTasks.map { TaskViewModel(managedTask: $0, context: context) }
            } catch {
                print("Error fetching tasks: \(error)")
                return []
            }
    }
    
    // CoreData에 Task를 저장하는 메소드
    func saveTask() {
        guard let task = self.task else { return }

        task.id = todo.id
        task.title = todo.title
        task.category = todo.category
        task.createDate = todo.createDate
        task.modifyDate = todo.modifyDate
        task.isCompleted = todo.isCompleted

        print("Saving task with title: \(todo.title)")

            do {
                try context.save()
                print("Task saved successfully.")
            } catch {
                print("Error saving task: \(error)")
            }
    }
}
