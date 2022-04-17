//
//  TodoDetailsVC.swift
//  Todo List
//
//  Created by Sultan Ali on 13/04/2022.
//

import UIKit

class TodoDetailsVC: UIViewController {
    
    var todo : TodoStruct!

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
    }
    



}
