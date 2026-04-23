//
//  ToDoSheet.swift
//  todo-list
//
//  Created by Camilo on 4/22/26.
//

import SwiftUI

public struct ToDoSheet<Content>: View where Content: View {
    @Binding public var isShow: Bool
    @ViewBuilder public var content: () -> Content
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            Color(uiColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.4))
                .ignoresSafeArea()
                .animation(nil, value: UUID())
                .onTapGesture {
                    isShow.toggle()
                }
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isShow.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .tint(.primary)
                    }
                    .padding()
                }
                
                content()
                Spacer()
            }
            .padding(24)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.7)
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(
                ToDoRoundedCorner(
                    radius: 20,
                    corners: [.topLeft, .topRight]
                )
            )
            .ignoresSafeArea(edges: .bottom)
            .zIndex(2.0)
            .transition(.move(edge: .bottom))
            .animation(nil, value: UUID())
        }
    }
}