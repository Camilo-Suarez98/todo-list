//
//  ToDoAddView.swift
//  todo-list
//
//  Created by Camilo on 4/22/26.
//

import SwiftUI

public struct ToDoAddView: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    @Binding var showed: Bool
    
    @State private var title = ""
    @State private var note = ""
    @State private var date = Date()
    
    public var todo: ToDoEntity? = nil
    
    public var dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startDate = Date.now
        let endDate = calendar.date(
            byAdding: .year,
            value: 10,
            to: startDate
        ) ?? startDate
        return startDate...endDate
    }()
    
    var isSaveDisabled: Bool {
        !viewModel.validateInput(ofText: title)
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            ToDoTextInput(
                "Ingrese nombre tarea",
                text: $title,
                label: "Tarea"
            )
            ToDoTextInput(
                "(Opcional) Escriba una descripción de la tarea",
                text: $note,
                label: "Nota"
            )
            DatePicker(
                selection: $date,
                in: dateRange
            ) {
                Text("Fecha y hora")
                    .font(.title3)
            }
            .tint(.primary)
            .padding(.vertical, 8)
            
            Spacer()
            
            Button {
                if let todos = todo {
                    
                } else {
                    viewModel.addToDo(
                        withTitle: title,
                        note: note,
                        date: date
                    )
                }
                showed.toggle()
            } label: {
                Text("Guardar".uppercased())
                    .font(.headline)
                    .tint(.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSaveDisabled ? Color(UIColor.systemGray5) : Color.teal)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .disabled(isSaveDisabled)
        }
    }
}

#Preview {
    NavigationView {
//        ToDoAddView(showed: .constant(true))
    }
}
