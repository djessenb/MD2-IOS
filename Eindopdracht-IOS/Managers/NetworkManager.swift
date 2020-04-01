//
//  NetworkManager.swift
//  Eindopdracht-IOS
//
//  Created by Stefan Willems on 27/03/2020.
//  Copyright © 2020 Stefan Willems. All rights reserved.
//

import Foundation

final class NetworkManager {
    
    let cache = NSCache<NSString, NSArray>()
    var pokemons: [Pokemon] = []
    
    func fetchPokemons(completionHandler: @escaping ([Pokemon]) -> Void) {
        if let cachedVersion = cache.object(forKey: "pokemons") as? [Pokemon]{
            // use the cached version
            pokemons = cachedVersion
            completionHandler(pokemons)
        }
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
            }
            
            if let data = data,
                let pokemons = try? JSONDecoder().decode(PokemonResponse.self, from: data) {
                self.cache.setObject(pokemons.results! as NSArray, forKey: "pokemons")
                completionHandler(pokemons.results ?? [])
            }
            
        })
        task.resume()
    }
}
