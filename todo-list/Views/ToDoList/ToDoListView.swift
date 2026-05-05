//
//  ToDoListView.swift
//  todo-list
//
//  Created by Camilo on 4/22/26.
//

import SwiftUI

public struct ToDoListView: View {
    @State private var showedSheet = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if showedSheet {
                    ToDoSheet(isShow: $showedSheet) {
                        ToDoAddView(showed: $showedSheet)
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .navigationTitle("ToDos")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 0) {
                    NavigationLink {
                        ToDoArchivedListView()
                    } label: {
                        Image(systemName: "trash")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.primary)
                    }
                    Button {
                        showedSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ToDoListView()
    }
}
