//
//  AddTaskViewController.swift
//  TodoApp
//
//  Created by Maurício Oliveira on 12/02/2019.
//  Copyright © 2019 Maurício Oliveira. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTextLabel: UITextField!
    
    @IBAction func addTaskAction(_ sender: Any) {
        
        if let taskText = taskTextLabel.text {
            let task = TaskUserDefaults()
            task.save(task: taskText)
            taskTextLabel.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
