//
//  PokemonModel.swift
//  pokemonDex
//
//  Created by Amelie Pocchiolo on 29/10/2022.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let abilities: [Abilities]
    let types: [TypeCore]
}

struct Abilities: Decodable {

    let ability: Ability
}

struct Ability: Decodable {

    let name: String
}

struct PokemonType: Codable, Hashable {
    let name: String

    static var samplePokemonT = PokemonType(name: "grass")
}

struct TypeCore: Codable, Hashable {
    let slot: Int
    let type: PokemonType

    // The type keys are IDs
    let typeId: String
    enum CodingKeys: CodingKey {
        case slot, type
    }
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container (keyedBy: CodingKeys.self)
        slot = try container.decode (Int.self, forKey: CodingKeys.slot)
        type = try container.decode(PokemonType.self, forKey: CodingKeys.type)
        typeId = container.codingPath.first!.stringValue
    }
}
