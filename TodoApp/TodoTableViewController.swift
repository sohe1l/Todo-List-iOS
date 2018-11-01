import UIKit

class TodoTableViewController: UITableViewController{
    
    
    var editId = 0
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getTasks().count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        cell.textLabel?.text = getTasks()[indexPath.row].title
        print( getTasks()[indexPath.row].title , " " , getTasks()[indexPath.row].completed)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editId = getTasks()[indexPath.row].id
        performSegue(withIdentifier: "taskTransition", sender: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func testPressed(_ sender: Any) {
        print("pp")
    }
    
    @IBAction func newTaskPressed(_ sender: Any) {
        
        print("aa")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? TaskController;
        dest?.isNewTask = false
        dest?.editId = editId
    }
    

    func getTasks() -> [Todo]{
        return TodoList.shared.getList()
    }
}

class TodoDoneViewController: TodoTableViewController{
    override func getTasks() -> [Todo]{
        return TodoList.shared.getListDone()
    }
}

class TodoPendingViewController: TodoTableViewController{
    override func getTasks() -> [Todo]{
        return TodoList.shared.getListPending()
    }
}
