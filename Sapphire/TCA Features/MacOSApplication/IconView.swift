//
//  MacOSApplicationIconView.swift
//  Sapphire
//
//  Created by Kody Deda on 5/20/21.
//

import SwiftUI
import ComposableArchitecture

struct IconView: View {
    let store: Store<MacOSApplication.State, MacOSApplication.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            FetchImageView(url: viewStore.iconURL)
        }
    }
}

struct MacOSApplicationIconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(store: MacOSApplication.defaultStore)
    }
}

// MARK:- ImageView
// Loads images really fast.

import FetchImage

fileprivate struct FetchImageView: View {
    let url: URL
    @StateObject private var image = FetchImage()

    var body: some View {
        ZStack {
            image.view?
                .resizable()
                .scaledToFill()
                .clipped()
        }
        .onAppear { image.load(url) }
        .onChange(of: url) { image.load($0) }
        .animation(.default, value: url)
    }
}

