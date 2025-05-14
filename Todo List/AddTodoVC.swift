//
//  AddTodoVC.swift
//  Todo List
//
//  Created by Sultan Ali on 14/04/2022.
//

import UIKit

class AddTodoVC: UIViewController {
    
    var todo : TodoStruct!
    var index: Int?
    var isCreation = true
    
    @IBOutlet var todoImage: UIImageView!
    @IBOutlet var addorEditButton: UIButton!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailsTextField: UITextField!
    
    @IBAction func changeImageButtonClicked(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isCreation{
            addorEditButton.setTitle("تعديل", for: UIControl.State.normal)
            navigationItem.title = "تعديل المهمة"
            titleTextField.text = todo.todoTitle
            detailsTextField.text = todo.todoDetails
            todoImage.image = todo.todoImage
        }

    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        if isCreation {
            
            let todo = TodoStruct(todoTitle: titleTextField.text!, todoImage: todoImage.image, todoDetails: detailsTextField.text!)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewTodoAdded"), object: nil, userInfo: ["TheNewTodo": todo])
            
            let alert = UIAlertController(title: "مبروك", message: "تمت اضافة المهمة بنجاح", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in self.moveToHomePage()}))
            present(alert, animated: true, completion: nil)
            
        } else {
            
            let todo = TodoStruct(todoTitle: titleTextField.text!, todoImage: todoImage.image, todoDetails: detailsTextField.text!)
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentTodoEdited"), object: nil, userInfo: ["EditedTodo": todo , "EditedTodoIndex": index!])
            
            let alert = UIAlertController(title: "مبروك", message: "تم تعديل المهمة بنجاح", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in self.navigationController?.popViewController(animated: true)}))
            present(alert, animated: true, completion: nil)
        }
 
        titleTextField.text = ""
        detailsTextField.text = ""
    }
    
    func moveToHomePage() {
        tabBarController?.selectedIndex = 0
        }

}

extension AddTodoVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        dismiss(animated: true)
        todoImage.image = image
        
    }

    
}
