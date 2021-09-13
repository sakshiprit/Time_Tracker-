//
//  ProjectListInteractor.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

class DataManager: ProjectDataManagerProtocol {
	weak var interactor: ProjectListInteractorInputProtocol?
    func getProjectList() -> [Project] {
		let projects = DataBase.getallProjects();
		return projects;
    }
}

