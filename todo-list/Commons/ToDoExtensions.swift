//
//  ToDoExtensions.swift
//  todo-list
//
//  Created by Camilo on 4/19/26.
//

import SwiftUI

extension View {
    public func cornerRadius(
        _ radius: CGFloat,
        corners: UIRectCorner
    ) -> some View {
        clipShape(
        ToDoRoundedCorner(
            radius: radius,
            corners: corners
        ))
    }
    
    public func transparentScrolling() -> some View {
        return onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}
