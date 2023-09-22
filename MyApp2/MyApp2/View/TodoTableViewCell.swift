//
//  SegmentedControllerTableViewCell.swift
//  MyApp2
//
//  Created by 보경 on 2023/08/10.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellMenuBtn: UIButton!
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet weak var createDateLabel: UILabel!
    @IBOutlet weak var modifyDateLabel: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    
    var taskViewModel: TaskViewModel? {
            didSet {
                guard let taskViewModel = taskViewModel else { return }
                updateUI(with: taskViewModel)
            }
        }
    func updateUI(with viewModel: TaskViewModel) {
        todoLabel.text = viewModel.todo.title
            
        // DateFormatter
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh시 mm분"

        createDateLabel.text = "생성: " +  formatter.string(from: viewModel.todo.createDate)
            
        if let modifyDate = viewModel.todo.modifyDate {
            modifyDateLabel.text = "수정: " +  formatter.string(from: modifyDate)
        } else {
            modifyDateLabel.text = "N/A"
        }
    }

}

