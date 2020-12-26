//
//  ThemeDetailView.swift
//  AdaptiveIcons
//
//  Created by Kody Deda on 12/24/20.
//

import SwiftUI
import Combine
import ComposableArchitecture
import Grid

struct ThemeDetailView: View {
    let store: Store<AppState, AppAction>
    
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                ScrollView {
                    Grid(Array(viewStore.selectedAppIcons)) { appIcon in
                        IconView(store: store, app: appIcon)
                    }.padding(16)
                }
                Spacer()
                HStack {
                    Button(action: {
                        viewStore.send(.setBackgroundForSelectedApps(Color.white))
                    }) {
                        Text("Add White Background")
                    }
                }
                Spacer()
            }
        }
    }
}

struct ThemeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeDetailView(store: defaultStore)
    }
}
