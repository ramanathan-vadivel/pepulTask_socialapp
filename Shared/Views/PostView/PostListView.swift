//
//  PostView.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import SwiftUI

struct PostListView: View {
    @StateObject var userDetailsViewModel = UserDetailsViewModel()
    @State private var tappedItem: Post?
    
    var body: some View {
        VStack{
            List() {
                ForEach(userDetailsViewModel.posts) { post in
                    Button(action: { tappedItem = post }) {
                        PostView(post: post)
                            .background(Color.white).cornerRadius(10)
                            .padding(.bottom)
                    }.onAppear() {
                        if (self.userDetailsViewModel.posts.last == post){
                            userDetailsViewModel.addItemOnBottom()
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            userDetailsViewModel.deletePost(post)
                            userDetailsViewModel.posts = userDetailsViewModel.posts.filter {$0 != post}
                        } label: {
                            Label(Constants.Delete, systemImage: Constants.Trash)
                        }
                    }
                }.background(
                    NavigationLink(
                        destination: PostView(post: tappedItem ?? ModelData().posts[0]),
                        isActive: Binding (
                            get: { tappedItem != nil },
                            set: { _,_ in tappedItem = nil }
                        )
                    ){
                        EmptyView()
                    })
                .listRowBackground(Color(red: 0.933, green: 0.933, blue: 0.933))
                .listRowInsets(EdgeInsets())
                .background(Color(red: 0.933, green: 0.933, blue: 0.933))
                .listRowSeparator(.hidden)
            }.refreshable {
                userDetailsViewModel.addItemOntop()
            }
        }
        .background(Color(red: 0.933, green: 0.933, blue: 0.933))
        .onAppear()  {
             userDetailsViewModel.getPost()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
