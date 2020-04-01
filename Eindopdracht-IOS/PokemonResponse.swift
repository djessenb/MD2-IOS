public struct PokemonResponse: Codable {
    public let count: Int
    public let next: String
    public let previous: String
    public let results: [Pokemon]
}
