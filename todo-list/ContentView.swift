//
//  ContentView.swift
//  todo-list
//
//  Created by Camilo on 4/19/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ToDoListView()
        }
        .tint(.primary)
    }
}

#Preview {
    ContentView()
}
