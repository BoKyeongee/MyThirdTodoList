//
//  TodoViewController.swift
//  MyApp2
//
//  Created by 남보경 on 2023/08/03.
//

import UIKit
import CoreData
import SwiftUI
import SnapKit

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var taskViewModels: [TaskViewModel] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 delegate
        tableView.delegate = self
        tableView.dataSource = self
        fetchTasks()
    }
    
    private func fetchTasks() {
        let viewModel = TaskViewModel(context: context, todo: Todo(id: UUID(), title: "", category: "", createDate: Date(), modifyDate: nil, isCompleted: false))
        taskViewModels = viewModel.fetchTasks()
        tableView.reloadData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {110}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TodoTableViewCell
        let taskViewModel = taskViewModels[indexPath.row]
        cell.updateUI(with: taskViewModel)

        if taskViewModel.todo.modifyDate == nil {
            cell.modifyDateLabel.isHidden = true
        }
        else {
            cell.modifyDateLabel.isHidden = false
        }
        // 기타 필요한 UI 설정 코드 (예: isCompleted에 따라서 체크 표시 등)
        return cell
    }


    @IBAction func inputPopup(_ sender: Any) {
        let alertController = UIAlertController(title: "할 일 입력", message: "해야 할 일을 입력하세요", preferredStyle: .alert)
        
        alertController.addTextField { textField in
                    textField.placeholder = "할 일  입력"
                }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let self = self else { return }
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                let newTask = Todo(id: UUID(), title: title, category: "", createDate: Date(), modifyDate: nil, isCompleted: false)
                let taskViewModel = TaskViewModel(context: self.context, todo: newTask)
                taskViewModel.saveTask()
                print(newTask)
                self.fetchTasks()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
}


//    // section 개수 반환
//    func numberOfSections(in tableView: UITableView) -> Int {1}
//
//    // cell 행 수 반환
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let data = fetchContact()
//        return data?.count ?? 1
//    }

//    // 왼쪽으로 swipe하면 삭제
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let delete = UIContextualAction(style: .normal, title: "삭제", handler: { action, view, completionHaldler in
//            let categories = defaults.array(forKey: "category") ?? data.category
//            let category = categories[indexPath.section] as! String
//
//            var todoData = defaults.dictionary(forKey: "todoData") as? [String:[String]] ?? data.todoData
//
//            var cellArray = todoData[category] ?? data.todoData[category]
//            let cellData = cellArray?[indexPath.row]
//            cellArray?.remove(at: indexPath.row)
//
//            if cellArray != nil {todoData.updateValue(cellArray!, forKey: category)}
//            else {todoData.removeValue(forKey: category )}
//            completionHaldler(true)
//            defaults.set(todoData, forKey: "todoData")
//
//            tableView.reloadData()
//        })
//
//        return UISwipeActionsConfiguration(actions: [delete])
//    }
    
    
    
//    // section header 반환
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if ((tableView.dataSource?.tableView(tableView, numberOfRowsInSection:section)) == 0) {
//            return nil;
//        }
//        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
//                                                                "sectionHeader") as! CustomHeader
//        let category = defaults.array(forKey: "category") ?? data.category
//        let emoji = defaults.array(forKey: "emoji") ?? data.emoji
//
//        view.title.text = category[section] as? String
//        view.emoji.text = emoji[section] as? String
//        view.contentView.backgroundColor = .secondarySystemBackground
//
//        return view
//    }
//
//    // section header 높이 설정
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
    
    //        // 상단 공백 없애기
    //        tableView.sectionHeaderTopPadding = 0
    //
    //        // header of footer 등록
    //        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")


