//
//  ProjectListView.swift
//  Time_tracker
//
//  Created by Sakshi Patil on 01/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

import UIKit

class ProjectListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: ProjectListPresenterProtocol?
    var ProjectList: [Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getprojects()
        tableView.tableFooterView = UIView()
    }
	
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        print("test")
//    }
    
	@IBAction func addProject() {
		textFieldAlertView("Add Project") { projectname,perhourCharge  in
			guard let hourlyRate = Int(perhourCharge ) else {
				showAlertView("Please enter correct details", text: "Per hour rate should be more than 0 and Integer")
				return
			}
			if DataBase.projectExist(name: projectname)   {
				showAlertView("Please enter correct details", text: "Project already exists")
				return
			}
			DataBase.addProject(projectname: projectname, perhourRate: hourlyRate)
			self.presenter?.getprojects()
		}
	}
    
}

extension ProjectListView: ProjectListViewProtocol {
        
    func showProjects(with projects: [Project]) {
        ProjectList = projects
		if ProjectList.count <= 0 {
			tableView.isHidden = true
		} else {
			tableView.isHidden = false
		}
        tableView.reloadData()
    }
}

extension ProjectListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectTableViewCell
        let project = ProjectList[indexPath.row]
        cell.set(forProject: project)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let project =  ProjectList[indexPath.row]
		presenter?.showProjectDetail(forProject: project);

    }
    
}
