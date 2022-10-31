//
//  PokemonView.swift
//  pokemonDex
//
//  Created by Amelie Pocchiolo on 29/10/2022.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        HStack{
            StyleImage(pokemon: pokemon)
            VStack{
                HStack{
                    Text("#\(vm.getPokemonIndex(pokemon: pokemon))")
                    Text("\(pokemon.name.capitalized)")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .padding()
                    
                    // Debug Print qui me renvoi nil. Mon type est vide ?
                        .onAppear{
                            print(vm.pokemonDetails?.types[0])
                        }
                    if let sType = vm.pokemonDetails?.types{
                        ForEach(sType, id: \.self) { type in
                            Text("type: \(type.type.name)")
                            // .onAppear{
                            // print(type.slot)
                            //}
                        }
                    }
                }
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
