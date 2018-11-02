import UIKit

class TaskController : UIViewController{
    
    @IBOutlet weak var taskTF: UITextField!
    
    @IBOutlet weak var saveBtnConst: NSLayoutConstraint!
    
    @IBOutlet weak var saveTaskConst: NSLayoutConstraint!
    
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    var isNewTask = false
    var editId = 0
    
    var taskTitle: String {
        if let text = taskTF.text {
            return text
        } else {
            return ""
        }
    }
    
    var isCompleted: Bool{
        if let res = completedSwitch{
            return res.isOn
        }else{
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isNewTask){
            completedLabel.isHidden = true
            completedSwitch.isHidden = true
            saveBtnConst.priority = UILayoutPriority(rawValue: 1)
            saveTaskConst.priority = UILayoutPriority(rawValue: 1000)
        }else{
            completedLabel.isHidden = false
            completedSwitch.isHidden = false
            saveBtnConst.priority = UILayoutPriority(rawValue: 1000)
            saveTaskConst.priority = UILayoutPriority(rawValue: 1)
            guard let todo = TodoList.shared.getTaskWithId(editId) else{
                navigationController?.popToRootViewController(animated: true)
                return
            }
            taskTF.text = todo.title
            completedSwitch.isOn = todo.completed
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if(taskTitle != ""){
            if(isNewTask){
                let newTask = Todo(taskTitle, isCompleted: false, id: TodoList.shared.getNextId())
                TodoList.shared.saveNewTask(newTask: newTask)
            }else{
                let updateTask = Todo(taskTitle, isCompleted: isCompleted, id: editId)
                TodoList.shared.updateTask(updateTask)
            }
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    @IBAction func deletePressed(_ sender: Any) {
        if(!isNewTask){
            TodoList.shared.deleteTask(editId)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
}
