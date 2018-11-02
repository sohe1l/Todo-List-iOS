//
//  TodoAppTests.swift
//  TodoAppTests
//
//  Created by Soheil on 11/1/18.
//  Copyright © 2018 sohe1l. All rights reserved.
//

import XCTest
@testable import TodoApp

class TodoAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAddTaskCheckExists() {
        let taskTitle = "Test Task 123"
        
        //insert the tast
        let newTask = Todo(
            taskTitle,
            isCompleted: true,
            id: TodoList.shared.getNextId()
        )

        TodoList.shared.saveNewTask(newTask: newTask)

        //check task exists
        let tastExists = TodoList.shared.getList().contains { (task: Todo) -> Bool in
            return task.title == taskTitle
        }

        XCTAssert(tastExists)
    }
    
    func testUpdateTask(){
        let taskTitle = "not yet compelted task"
        let isCompleted = false
        
        //insert the tast
        let newTask = Todo(
            taskTitle,
            isCompleted: isCompleted,
            id: TodoList.shared.getNextId()
        )
        TodoList.shared.saveNewTask(newTask: newTask)


        // here we are simulating the same steps we are taken in the app
        let taskTitleUpdated = "Updated task title"
        let editId = newTask.id
        let updateTask = Todo(taskTitleUpdated, isCompleted: !isCompleted, id: editId)
        TodoList.shared.updateTask(updateTask)
        
        //retrive the task again and check if updated
        let taskAfterUpdate = TodoList.shared.getTaskWithId(editId)
        
        //make sure to find the task
        XCTAssertNotNil(taskAfterUpdate)
        
        // check it is actually updated
        let updatedTask = taskAfterUpdate!
        XCTAssert(updatedTask.completed !=  isCompleted)
        XCTAssertEqual(updatedTask.title, taskTitleUpdated)
    }

    
    
}
