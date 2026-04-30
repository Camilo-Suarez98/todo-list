//
//  ToDoPersistenceManager.swift
//  todo-list
//
//  Created by Camilo on 4/29/26.
//

import CoreData

final class ToDoPersistenceManager {
    static let shared = ToDoPersistenceManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error cargando datos: \(error)")
            } else {
                print("Carga de datos exitosa")
            }
        }
    }
}
