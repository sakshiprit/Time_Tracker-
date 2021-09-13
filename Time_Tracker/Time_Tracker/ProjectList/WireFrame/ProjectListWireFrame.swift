//
//  ProjectListWireFrame.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

import UIKit

class ProjectListWireFrame: ProjectListWireFrameProtocol {
    
    static func createProjectListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ProjectsNavigationController")
        if let view = navController.childViewControllers.first as? ProjectListView {
            let presenter: ProjectListPresenterProtocol & ProjectListInteractorOutputProtocol = ProjectListPresenter()
            let interactor: ProjectListInteractorInputProtocol  = ProjectListInteractor()
            let wireFrame: ProjectListWireFrameProtocol = ProjectListWireFrame()
			let dataManager: ProjectDataManagerProtocol = DataManager()
			
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
			interactor.dataManager = dataManager
			dataManager.interactor = interactor;
			
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
	func presentProjectDetailScreen(from view: ProjectListViewProtocol, forProject project: Project) {
		let projectDetailViewController = TaskListWireFrame.createTaskListModule(project)
		if let sourceView = view as? UIViewController {
			sourceView.navigationController?.pushViewController(projectDetailViewController, animated: true)
		}
	}

}
