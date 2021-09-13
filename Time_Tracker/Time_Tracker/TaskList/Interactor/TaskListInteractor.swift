//
//  TaskListInteractor.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

class TaskListInteractor: TaskListInteractorInputProtocol {
    weak var presenter: TaskListInteractorOutputProtocol?
    func retrieveTaskList(_ project:Project) {
		let tasks = DataBase.getallTasks(project: project);
		presenter?.didRetrieveTasks(tasks);
    }
}
