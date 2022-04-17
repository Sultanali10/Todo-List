//
//  TodoVC.swift
//  Todo List
//
//  Created by Sultan Ali on 13/04/2022.
//

import UIKit

class TodoVC: UIViewController {
   
    var todosArray = [
        TodoStruct(todoTitle: "رياضة المشي", todoImage: UIImage(named: "Image-2"), todoDetails: "المشي مفيد جدا لازم نمشي كل يوم لمدة نصف ساعة لمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لاز"),
        TodoStruct(todoTitle: "قراءة كتاب", todoImage: UIImage(named: "Image-1"), todoDetails: "لمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لاز"),
        TodoStruct(todoTitle: "لقاء الاصدقاء", todoDetails: "لمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لاز"),
        TodoStruct(todoTitle: "اللعب", todoImage: UIImage(named: "Image-3")),
        TodoStruct(todoTitle: "مشاهدة مباراة", todoDetails: "لمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لازلمشي مفيد جدا لاز")
    ]
    @IBOutlet var todosTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todosTableView.dataSource = self
        todosTableView.delegate = self
        navigationItem.title = "مهامي"
        
        NotificationCenter.default.addObserver(self, selector: #selector(newTodoAdded), name: NSNotification.Name(rawValue: "NewTodoAdded"), object: nil)
       
    }
    
    @objc func newTodoAdded(notification : Notification){
        
        if let todo = notification.userInfo?["TheNewTodo"] as? TodoStruct{
            todosArray.append(todo)
            todosTableView.reloadData()

        }
        
        
    }
    

    

}


extension TodoVC: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCellID") as! TodosTableCell
        cell.todoTitleLabel.text = todosArray[indexPath.row].todoTitle
        
        if todosArray[indexPath.row].todoImage != nil{
            cell.todoImageView.image = todosArray[indexPath.row].todoImage
        } else {
            cell.todoImageView.image = UIImage(named: "Default")
        }
        
        cell.todoImageView.layer.cornerRadius = cell.todoImageView.frame.width / 2
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "TodoDetails") as? TodoDetailsVC

        if let viewC = vc {
            viewC.todo = todosArray[indexPath.row]
            navigationController?.pushViewController(viewC, animated: true)
        }
        
        
    }
    
}
