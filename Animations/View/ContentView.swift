//
//  ContentView.swift
//  Animations
//
//  Created by Вадим Эфис on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0 // 1.0 при .animation
    @State private var newviewIsOn = false
    @State private var secviewIsOn = false
    @State private var enabled = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Button("Tap Me Now") {
                        enabled.toggle()
                    }
                    .frame(width: 200, height: 200)
                    .background(enabled ? .blue : .red)
                    .animation(nil, value: enabled)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                    .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
                    
                    Button("Tap Me") {
                        withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                            animationAmount += 360
                        }
                        // animationAmount += 1   ---- при .animation
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                    // .overlay(
                    //     Circle()
                    //         .stroke(.red)
                    //       .scaleEffect(animationAmount)
                    //     .opacity(2 - animationAmount)
                    //         .animation(
                    //             .easeInOut(duration: 1)
                    //                .repeatForever(autoreverses: false),
                    //            value: animationAmount
                    //        )
                    //)
                    // .scaleEffect(animationAmount)
                    //.blur(radius: (animationAmount - 1) * 3)
                    //.animation(.default, value: animationAmount)
                    /* .animation(
                     .easeInOut(duration: 2)
                     .delay(1),
                     value: animationAmount
                     )
                     */
                    .onAppear {
                        animationAmount = 2
                    }
                    NavigationLink(isActive: $newviewIsOn) {
                        NewView()
                    } label: {
                        Button {
                            newviewIsOn.toggle()
                        } label: {
                            Text("Переход на Другую Вьюшку")
                        }
                    }
                    .padding()
                    NavigationLink(isActive: $secviewIsOn) {
                        Gestures()
                    } label: {
                        Button {
                            secviewIsOn.toggle()
                        } label: {
                            Text("Переходик")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
