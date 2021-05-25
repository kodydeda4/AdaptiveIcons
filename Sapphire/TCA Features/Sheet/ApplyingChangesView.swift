//
//  ApplyingChangesView.swift
//  Sapphire
//
//  Created by Kody Deda on 5/25/21.
//


import SwiftUI
import ComposableArchitecture

struct ApplyingChanges: View {
    let store: Store<Grid.State, Grid.Action>
    @State var opacity = true
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Group {
                    Image("SapphireIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                    
                    Text("Applying Changes")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                }
                .opacity(opacity ? 1 : 0)
                .animation(Animation.easeInOut(duration: 1.25).repeatForever(), value: opacity)
                
                Button("Cancel") {
                    viewStore.send(.cancelButtonTapped)
                }
            }
            .padding(30)
            .onAppear { opacity.toggle() }
        }
    }
}

struct ApplyingChanges_Previews: PreviewProvider {
    static var previews: some View {
        ApplyingChanges(store: Grid.defaultStore)
    }
}