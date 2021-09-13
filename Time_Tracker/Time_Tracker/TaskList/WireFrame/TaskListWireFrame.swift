
import UIKit

class TaskListWireFrame: TaskListWireFrameProtocol {

    
	class func createTaskListModule(_ project:Project) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TaskListViewController")
		if let view = viewController as? TaskListView {
			let presenter: TaskListPresenterProtocol & TaskListInteractorOutputProtocol = TaskListPresenter()
			let interactor: TaskListInteractorInputProtocol  = TaskListInteractor()
			let wireFrame: TaskListWireFrameProtocol = TaskListWireFrame()
            view.project = project;
			view.presenter = presenter
			presenter.view = view
			presenter.wireFrame = wireFrame
			presenter.interactor = interactor
			interactor.presenter = presenter			
		}
		return viewController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
	
	func presentTaskDetailScreen(from view: TaskListViewProtocol, forTask task: Task) {
	}

}
