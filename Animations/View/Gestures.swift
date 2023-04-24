//
//  Gestures.swift
//  Animations
//
//  Created by Вадим Эфис on 24.04.2023.
//

import SwiftUI

struct Gestures: View {
    
    @State private var dragAmount = CGSize.zero
    @State private var gesturesViewIsOn = false
    @State private var isShowingRed = false
    
    var body: some View {
        NavigationView{
            VStack {
                LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                        // .onEnded { _ in dragAmount = .zero }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    dragAmount = .zero
                                }
                            }
                    )
                //.animation(.spring(), value: dragAmount)
                Button("Tap Me") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
                .padding()
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        //.transition(.scale)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
                
                NavigationLink(isActive: $gesturesViewIsOn) {
                    GesturesView()
                } label: {
                    Button {
                        gesturesViewIsOn.toggle()
                    } label: {
                        Text("Magic")
                    }
                }
            }
        }
    }
}

struct Gestures_Previews: PreviewProvider {
    static var previews: some View {
        Gestures()
    }
}
