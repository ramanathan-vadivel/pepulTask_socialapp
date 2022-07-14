//
//  StringConstants.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import Foundation

struct Constants {
    static let BASEURL = "https://nextgenerationsocialnetwork.com/user_details/"
    static let Delete = "Delete"
    static let Trash = "trash"
    static let AppTitle = "Posts"
    static let Success = "Success"
}

enum ErrorConstants {
    case Success
    case NoNetworkError
    case EmptyResponse
    case InternalServerError
    case TimeoutError
    case Failure
    case DataError
    
    var rawValue : String {
        var errorConstantContent = ""
        switch self {
        case .Success:
            errorConstantContent = "Success"
        case .NoNetworkError:
            errorConstantContent = "No Connection! Please Try Again Later"
        case .EmptyResponse:
            errorConstantContent = "No Data Available"
        case .DataError:
            errorConstantContent = "Something Went Wrong. Try Again Later"
        case .InternalServerError:
            errorConstantContent = "Internal Server Error. Try Again Later"
        case .TimeoutError:
            errorConstantContent = "Not Reachable. Try Again Later"
        case .Failure:
            errorConstantContent = "Something Went Wrong. Try Again Later"
        }
        return errorConstantContent
    }
}
