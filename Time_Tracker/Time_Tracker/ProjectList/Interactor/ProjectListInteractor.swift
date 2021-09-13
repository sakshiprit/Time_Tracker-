//
//  ProjectListInteractor.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

class ProjectListInteractor: ProjectListInteractorInputProtocol {
    weak var presenter: ProjectListInteractorOutputProtocol?
	var dataManager: ProjectDataManagerProtocol?

    func retrieveProjectList()  {
		  let projects =  dataManager?.getProjectList()
		// let projects = Project.getallProjects();
		presenter?.didRetrieveProjects(projects!)
    }
	
}

