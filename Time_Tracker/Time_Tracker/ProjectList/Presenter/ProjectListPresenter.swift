//
//  ProjectListPresenter.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

class ProjectListPresenter: ProjectListPresenterProtocol {
    weak var view: ProjectListViewProtocol?
    var interactor: ProjectListInteractorInputProtocol?
    var wireFrame: ProjectListWireFrameProtocol?
    
    func getprojects() {
        interactor?.retrieveProjectList()
    }
    
	func showProjectDetail(forProject project: Project) {
		wireFrame?.presentProjectDetailScreen(from: view!, forProject: project)
	}
}

extension ProjectListPresenter: ProjectListInteractorOutputProtocol {
    
	func didRetrieveProjects(_ projects: [Project]) {
		view?.showProjects(with: projects)
	}
}


