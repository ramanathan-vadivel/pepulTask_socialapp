//
//  UserDetailsViewModel.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import SwiftUI

class UserDetailsViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    func addItemOntop() {
        let lastFetchId = self.posts[posts.count-1].id ?? ""
        self.getPostFromURL(lastFetchId) { data in
            DispatchQueue.main.async {
                self.posts.insert(contentsOf: data, at: 0)
                print(data)
            }
        }
    }
    
    func addItemOnBottom() {
        let lastFetchId = self.posts[posts.count-1].id ?? ""
        self.getPostFromURL(lastFetchId) { data in
            DispatchQueue.main.async {
                self.posts.append(contentsOf: data)
                print(data)
            }
        }
    }
    
    func getPost() {
        self.getPostFromURL("") { data in
            DispatchQueue.main.async {
                self.posts = data
                print(data)
            }
        }
    }
    
    func getPostFromURL(_ lastFetchId: String, completion: @escaping([Post]) -> Void) -> Void  {
        UserDetailsService.shared.getUserPosts(lastFetchId: lastFetchId,
                                               completion: {(data, response, error) in
            if data != nil {
                completion(data?.data ?? [])
            }
        })
    }
    
    func deletePost(_ post: Post) {
        UserDetailsService.shared.deletePost(postId: post.id ?? "",
                                             completion: {(data, response, error) in
            if data?.message == Constants.Success {
                DispatchQueue.main.async {
                    self.posts = self.posts.filter {$0 != post}
                }
            }
        })
    }
}
