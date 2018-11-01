import UIKit

class TasksTabsConstoller: UITabBarController{
    
    @IBAction func newTaskPressed(_ sender: Any) {
        performSegue(withIdentifier: "taskTransition", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var dest = segue.destination as? TaskController;
        dest?.isNewTask = true;
    }

}
