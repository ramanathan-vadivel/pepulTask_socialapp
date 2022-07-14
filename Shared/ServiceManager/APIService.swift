//
//  APIService.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import Foundation

enum APIEndpoit : String {
    case GetUserDetail = "select.php"
    case DeletePost = "delete.php"
}

enum APIRequestParamterKey : String {
    case LastFetchId = "lastFetchId"
    case Id = "id"
}

class APIService {
        
    static let shared =  APIService()
        
    private init(){}
    
    func httpRequest <T: Codable>(
            endpoint: String,
            parameters: [String: Any],
            completion: @escaping(T?, URLResponse?, Error?) -> Void
        ) {
        guard let url = URL(string : Constants.BASEURL + endpoint) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(nil, response, error)
                return
            }
            completion(self.parseJSON(T.self, from: data), response, nil)
            
        }.resume()
        
    }
    
    private func parseJSON<T: Codable>(_ model: T.Type, from: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(model.self , from: from)
            print("*** Blogs json Response \(decodedData)")
            return decodedData
        } catch {
            print("*** Error decoding the blog data \(error)")
            return nil
        }
    }
    
}
