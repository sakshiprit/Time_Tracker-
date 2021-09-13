//
//  AppDelegate.swift
//  Time_Tracker
//
//  Created by Sakshi Patil on  30/08/2021.
//  Copyright © 2021 Sakshi Patil. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers  class Project: Object {

	 dynamic var name = ""
	 dynamic var perhourRate = 0
	 dynamic var created = NSDate()
	 dynamic var taskDetails =  List<Task>()

	 override static func primaryKey() -> String? {
		return "name"
	 }

	convenience init(projectname: String?, perhourRate: Int?) {
		self.init()
		self.name = projectname!
		self.perhourRate = perhourRate!
	}
	
}

@objcMembers class Task : Object {

     dynamic var name = ""
     dynamic var hours = 0
     dynamic var created = NSDate()
    
    convenience init(taskname: String?, hoursSpent: Int?) {
        self.init()
        self.name = taskname!
        self.hours = hoursSpent!
    }
}

class DataBase {
	static func all(in realm: Realm = try! Realm()) -> Results<Project> {
		return realm.objects(Project.self)
			.sorted(byKeyPath: "created")
		
	}
	
	static func projectExist (name: String,in realm: Realm = try! Realm()) -> Bool {
		return realm.object(ofType: Project.self, forPrimaryKey: name) != nil
	}
	
	static func getallProjects(in realm: Realm = try! Realm()) -> [Project] {			
		let results  =	realm.objects(Project.self)
            .sorted(byKeyPath: "created")
		let array = Array(results) 
		return array;
	}
	
	@discardableResult
	static func addProject(projectname: String, perhourRate: Int,in realm: Realm = try! Realm())
		-> Project {
			let item = Project(projectname:projectname, perhourRate: perhourRate);
			try! realm.write {
				realm.add(item)
			}
			return item
	}
	
    static func getallTasks(project:Project,in realm: Realm = try! Realm()) -> [Task] {
        let results  = project.taskDetails;
        let array = Array(results)
        return array;
    }
    
    @discardableResult
    static func addTask(taskname: String, hoursSpent: Int,project: Project,in realm: Realm = try! Realm())
        -> Task {
            let item = Task(taskname:taskname, hoursSpent: hoursSpent);
            try! realm.write {
                realm.add(item)
                project.taskDetails.append(item)
            }
            return item
    }
}



