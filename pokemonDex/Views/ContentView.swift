//
//  ContentView.swift
//  pokemonDex
//
//  Created by Amelie Pocchiolo on 29/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()

    var body: some View {
        NavigationView {
            List{
                ForEach(vm.filteredPokemon) { pokemon in
                    NavigationLink {
                        PokemonDetailView(pokemon: pokemon)
                    } label: {
                        PokemonView(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
