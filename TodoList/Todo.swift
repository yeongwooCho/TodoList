//
//  Todo.swift
//  TodoList
//
//  Created by 조영우 on 2021/03/02.
//

import UIKit

struct Todo: Codable, Equatable {
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        // TODO: 업데이트 로직 추가
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        // TODO: 동등 조건 추가
        return true
    }
}

class TodoManager {
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        // TODO: create로직 추가
        return Todo(id: 1, isDone: false, detail: "2", isToday: true)
    }
    
    func addTodo(_ todo: Todo) {
        // Todo: add 로직 추가
    }
    
    func deleteTodo(_ todo: Todo) {
        // Todo: delete 로직 추가
    }
    
    func updateTodo(_ todo: Todo) {
        // Todo: update 로직 추가
    }
    
    func saveTodo() {}
}

class TodoViewModel {
    
    enum Section: Int, CaseIterable {
        case today
        case upcoming
        
        var title: String {
            switch self {
            case .today: return "Today"
            default: return "Upcoming"
            }
        }
    }
}
