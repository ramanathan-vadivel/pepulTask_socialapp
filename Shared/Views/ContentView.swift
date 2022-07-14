//
//  ContentView.swift
//  Shared
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            PostListView()
                .navigationTitle(Text(Constants.AppTitle))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
