//
//  TaskCategoryViewModel.swift
//  MyApp2
//
//  Created by 보경 on 2023/09/22.
//

import Foundation
import CoreData

class CategoryViewModel {
    
    // CoreData Entity
    private var category: Category?
    private var context: NSManagedObjectContext
    
    // TaskCategory struct representation
    var taskCategory: TaskCategory {
        didSet {
            guard let category = category else { return }
            category.id = taskCategory.id
            category.title = taskCategory.title
            category.emoji = taskCategory.emoji
        }
    }
    
    // CoreData context를 주입받아 초기화
    init(context: NSManagedObjectContext, taskCategory: TaskCategory) {
        self.context = context
        self.taskCategory = taskCategory
        self.category = Category(context: context)
    }
    
    init(managedCategory: Category, context: NSManagedObjectContext) {
        self.category = managedCategory
        self.context = context
        self.taskCategory = TaskCategory(
            id: managedCategory.id ?? UUID(),
            title: managedCategory.title ?? "",
            emoji: managedCategory.emoji ?? ""
        )
    }
    
    // CoreData에서 Category를 가져오는 메소드
    func fetchCategories() -> [CategoryViewModel] {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            let managedCategories = try context.fetch(request)
            return managedCategories.map { CategoryViewModel(managedCategory: $0, context: context) }
        } catch {
            print("Error fetching categories: \(error)")
            return []
        }
    }
    
    // CoreData에 Category를 저장하는 메소드
    func saveCategory() {
        do {
            try context.save()
        } catch {
            print("Error saving category: \(error)")
        }
    }
}
