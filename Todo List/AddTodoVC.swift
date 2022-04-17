//
//  AddTodoVC.swift
//  Todo List
//
//  Created by Sultan Ali on 14/04/2022.
//

import UIKit

class AddTodoVC: UIViewController {

    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        let todo = TodoStruct(todoTitle: titleTextField.text!, todoImage: nil, todoDetails: detailsTextField.text!)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewTodoAdded"), object: nil, userInfo: ["TheNewTodo": todo])
    }
    

}
