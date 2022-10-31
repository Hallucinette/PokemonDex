//
//  PokemonDetailView.swift
//  pokemonDex
//
//  Created by Amelie Pocchiolo on 29/10/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("DETAILS")) {
                    
                    VStack(spacing: 10) {
                        StyleImage(pokemon: pokemon)
                        Text("\(pokemon.name)")
                            .padding()
                    }
                }
                Section(header: Text("ABILITIES")) {
                    
                    Text("**ID**: \(vm.getPokemonIndex(pokemon: pokemon))")
                    Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                    Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
                }
            }
            .navigationTitle("#\(vm.getPokemonIndex(pokemon: pokemon))"+" "+"\(pokemon.name)")
            .navigationBarTitleDisplayMode(.inline)
            .font(.system(size: 16, weight: .regular, design: .monospaced))
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
