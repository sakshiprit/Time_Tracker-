
import UIKit

protocol ProjectListViewProtocol: class {
    var presenter: ProjectListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showProjects(with projects: [Project])
}

protocol ProjectListWireFrameProtocol: class {
    static func createProjectListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentProjectDetailScreen(from view: ProjectListViewProtocol, forProject project: Project)
}

protocol ProjectListPresenterProtocol: class {
    var view: ProjectListViewProtocol? { get set }
    var interactor: ProjectListInteractorInputProtocol? { get set }
    var wireFrame: ProjectListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func getprojects()
    func showProjectDetail(forProject project: Project)
}

protocol ProjectListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveProjects(_ projects: [Project])
}

protocol ProjectListInteractorInputProtocol: class {
    var presenter: ProjectListInteractorOutputProtocol? { get set }
	var dataManager: ProjectDataManagerProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func retrieveProjectList()
}

protocol ProjectDataManagerProtocol: class {
	// Interactor -> Datamanager
	var interactor: ProjectListInteractorInputProtocol? { get set }
	func getProjectList() -> [Project]
}

