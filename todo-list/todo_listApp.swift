//
//  todo_listApp.swift
//  todo-list
//
//  Created by Camilo on 4/19/26.
//

import SwiftUI

@main
struct todo_listApp: App {
    @StateObject private var viewModel: ToDoViewModel = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
