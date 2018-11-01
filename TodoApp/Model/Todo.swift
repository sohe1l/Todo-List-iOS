import Foundation

class Todo: Codable{
    
    var title: String
    var completed = false
    var id: Int
    
    init(title: String, id: Int){
        self.title = title
        self.id = id
    }
    
    init(_ title: String, isCompleted: Bool, id: Int){
        self.title = title
        self.completed = isCompleted
        self.id = id
    }
}
