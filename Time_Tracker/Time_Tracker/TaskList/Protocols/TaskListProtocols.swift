//
//  TaskListProtocols.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

import UIKit

protocol TaskListViewProtocol: class {
    var presenter: TaskListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showTasks(with tasks: [Task])
    
}

protocol TaskListWireFrameProtocol: class {
    static func createTaskListModule(_ project:Project) -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentTaskDetailScreen(from view: TaskListViewProtocol, forTask task: Task)
}

protocol TaskListPresenterProtocol: class {
    var view: TaskListViewProtocol? { get set }
    var interactor: TaskListInteractorInputProtocol? { get set }
    var wireFrame: TaskListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad(_ project:Project)
    func showTaskDetail(forTask task: Task)
}

protocol TaskListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveTasks(_ tasks: [Task])
}

protocol TaskListInteractorInputProtocol: class {
    var presenter: TaskListInteractorOutputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func retrieveTaskList(_ project:Project)
}

