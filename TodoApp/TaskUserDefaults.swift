//
//  TaskUserDefaults.swift
//  TodoApp
//
//  Created by Maurício Oliveira on 12/02/2019.
//  Copyright © 2019 Maurício Oliveira. All rights reserved.
//

import UIKit

class TaskUserDefaults {
    
    let key = "TaskList"
    var tasks: [String] = []
    
    func save (task: String) {
        
        tasks = loadTask()
        
        tasks.append(task)
        UserDefaults.standard.set(tasks, forKey: key)
    }
    
    func loadTask () -> Array<String> {
        let data = UserDefaults.standard.object(forKey: key)
        
        if data != nil {
            return data as! Array<String>
        } else {
            return []
        }
    }
    
    func delete (index: Int) {
        tasks = loadTask()
        
        tasks.remove(at: index)
        UserDefaults.standard.set(tasks, forKey: key)
    }
    
}
