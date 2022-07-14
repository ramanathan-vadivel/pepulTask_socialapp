//
//  UserDetailsService.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import Foundation

class UserDetailsService {
    
    private init(){}
    
    static var shared : UserDetailsService {
        return UserDetailsService()
    }
    
    func getUserPosts(lastFetchId:String?,
                   completion: @escaping (UserDetails?, URLResponse?, Error?) -> Void) -> Void {
        let parameters = getUserDetailsParameters(lastFetchId ?? "")
        APIService.shared.httpRequest(endpoint: APIEndpoit.GetUserDetail.rawValue,
                                      parameters: parameters,
                                      completion: completion)
    }
    
    private func getUserDetailsParameters(_ lastFetchId : String) -> [String:Any] {
        return [APIRequestParamterKey.LastFetchId.rawValue: lastFetchId]
    }
    
    func deletePost(postId:String,
                   completion: @escaping (DeletePost?, URLResponse?, Error?) -> Void) -> Void {
        let parameters = getDeletePostParameters(postId)
        APIService.shared.httpRequest(endpoint: APIEndpoit.DeletePost.rawValue,
                                      parameters: parameters,
                                      completion: completion)
    }
    
    private func getDeletePostParameters(_ postId : String) -> [String:Any] {
        return [APIRequestParamterKey.Id.rawValue: postId]
    }
}

