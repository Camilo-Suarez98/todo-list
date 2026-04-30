//
//  ToDoViewModel.swift
//  todo-list
//
//  Created by Camilo on 4/29/26.
//

import Foundation
import CoreData
import Combine

public final class ToDoViewModel: ObservableObject {
    @Published private(set) var todos: [ToDoEntity] = []
    var cancellables = Set<AnyCancellable>()
    private var storeContainer: NSPersistentContainer {
        return ToDoPersistenceManager.shared.container
    }
    
    init() {
        fetchToDos()
    }
    
    private func fetchToDos() {
        do {
            let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
            let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            request.returnsObjectsAsFaults = false
            todos = try storeContainer.viewContext.fetch(request)
        } catch {
            print("Error al recuperar los ToDos")
        }
    }
    
    private func  saveData() {
        do {
            try storeContainer.viewContext.save()
            fetchToDos()
        } catch {
            print("Error al guardar datos")
        }
    }
    
    private func getToDoIndex(todo: ToDoEntity) -> Int? {
        guard
            let index = todos.firstIndex(where: { $0.id == todo.id })
        else { return nil}
        
        return index
    }
    
    public func validateInput(ofText text: String) -> Bool {
        guard
            text.trimmingCharacters(in: .whitespaces).count > 2
        else { return false }
        
        return true
    }
    
    public func addToDO() {
        
    }
    
    public func updateToDo () {
        
    }
    
    public func updateToDoStatus() {
        
    }
    
    public func deleteToDo() {
        
    }
    
    public func archiveToDo() {
        
    }
    
    public func unArchiveToDo() {
        
    }
}
