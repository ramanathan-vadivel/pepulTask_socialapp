//
//  ModelData.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var userDetails: UserDetails = load("userdetails.json")
    
    var posts: [Post] {
        userDetails.data
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Could not find \(fileName) in the Bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(fileName) from the Bundle: \n\(error) ")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(fileName) as \(T.self) \n\(error) ")
    }
    
}
