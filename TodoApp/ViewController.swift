//
//  ViewController.swift
//  TodoApp
//
//  Created by Maurício Oliveira on 12/02/2019.
//  Copyright © 2019 Maurício Oliveira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadTaskList() {
        let userDefault = TaskUserDefaults()
        tasks = userDefault.loadTask()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       loadTaskList()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reuseCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let userDefaults = TaskUserDefaults()
            userDefaults.delete(index: indexPath.row)
            
            loadTaskList()
        }
        
    }
}

