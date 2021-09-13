//
//  TaskListTableViewCell.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 19/02/17.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
	@IBOutlet weak var hoursLabel: UILabel!

    func set(forTask task: Task) {
        self.selectionStyle = .none
		taskNameLabel?.text = "Task Name:   " + task.name
		hoursLabel?.text = "Hours  Spent:   " + String(task.hours)
    }
}
