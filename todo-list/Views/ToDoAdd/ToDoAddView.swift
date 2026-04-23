//
//  ToDoAddView.swift
//  todo-list
//
//  Created by Camilo on 4/22/26.
//

import SwiftUI

public struct ToDoAddView: View {
    public var todo: ToDoEntity? = nil
    
    public var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Button {
                
            } label: {
                Text("Guardar".uppercased())
                    .font(.headline)
                    .tint(.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    ToDoAddView()
}
