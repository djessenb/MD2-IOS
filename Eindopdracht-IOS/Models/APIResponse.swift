import Foundation

struct PokemonResponse: Codable {
    let count: Int?
    let results: [Pokemon]?
}

struct Pokemon: Codable {
    let name: String
    let url: String
    
    init(name: String,
         url: String) {
        self.name = name
        self.url = url
    }
}
