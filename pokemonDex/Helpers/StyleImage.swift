//
//  StyleImage.swift
//  pokemonDex
//
//  Created by Amelie Pocchiolo on 30/10/2022.
//

import SwiftUI

struct StyleImage: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 100
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
            { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
        }
    }
}

struct StyleImage_Previews: PreviewProvider {
    static var previews: some View {
        StyleImage(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
