//
//  TaskListPresenter.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

class TaskListPresenter: TaskListPresenterProtocol {
    weak var view: TaskListViewProtocol?
    var interactor: TaskListInteractorInputProtocol?
    var wireFrame: TaskListWireFrameProtocol?
    
    func viewDidLoad(_ project:Project) {
        interactor?.retrieveTaskList(project)
    }
    

	func showTaskDetail(forTask task: Task) {
		wireFrame?.presentTaskDetailScreen(from: view!, forTask: task)
	}
}

extension TaskListPresenter: TaskListInteractorOutputProtocol {
    
	func didRetrieveTasks(_ tasks: [Task]) {
		view?.showTasks(with: tasks)
	}

    
}


