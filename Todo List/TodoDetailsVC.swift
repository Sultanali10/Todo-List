//
//  TodoDetailsVC.swift
//  Todo List
//
//  Created by Sultan Ali on 13/04/2022.
//

import UIKit

class TodoDetailsVC: UIViewController {
    
    var todo : TodoStruct!
    var index: Int?
    
    @IBOutlet var detailsDetails: UILabel!
    @IBOutlet var detailsTitle: UILabel!
    @IBOutlet var detailsImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTitle.text = todo.todoTitle
        detailsDetails.text = todo.todoDetails
        
        if todo.todoImage != nil {
            detailsImage.image = todo.todoImage
        } else {
            detailsImage.image = UIImage(named: "Default")
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(currentTodoEdited), name: NSNotification.Name("CurrentTodoEdited"), object: nil)
    }
    
    @objc func currentTodoEdited(notification : Notification) {
        if let todo = notification.userInfo?["EditedTodo"] as? TodoStruct{
            self.todo = todo
            detailsTitle.text = todo.todoTitle
            detailsDetails.text = todo.todoDetails
        }
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "AddOrEditVC") as? AddTodoVC
        
        if let vcn = vc {
            vcn.isCreation = false
            vcn.todo = todo
            vcn.index = index
            navigationController?.pushViewController(vcn, animated: true)
        }
        
    }
    


}
