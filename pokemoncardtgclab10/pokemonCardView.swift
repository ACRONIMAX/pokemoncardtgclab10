//
//  pokemonCard.swift
//  pokemoncardtgclab10
//
//  Created by Cesar Merlo on 14/3/21.
//

import SwiftUI

extension Image {
    func data(imageUrl: URL) -> Self {
        if let data = try? Data(contentsOf: imageUrl) {
            guard let pokemonCardImage = UIImage(data: data) else {
                return Image(systemName: "square.fill")
            }
            return Image(uiImage: pokemonCardImage).resizable()
        }
        return self.resizable()
    }
}

struct pokemonCardView: View {
    @State var pokemonName: String
    @State var pokemonCardsUrl: [String]
    
    var body: some View {
        VStack{
            Text(pokemonName.capitalized)
                .font(.title)
            if pokemonCardsUrl.isEmpty == false {
                List(pokemonCardsUrl, id: \.self) { cardUrl in
                    if let url = URL(string: cardUrl) {
                        Image(systemName: "square.fill").data(imageUrl: url)
                            .aspectRatio(contentMode: .fit)
                    }
                }.listStyle(GroupedListStyle())
            } else {
                Text("Was not found")
                    .font(.subheadline)
            }
        }.onAppear{
            PokemonData().getPokemonCards(pokemonName: pokemonName) { (pokemonData) in
                self.pokemonCardsUrl = []
                pokemonData.forEach { pokemon in
                    self.pokemonCardsUrl.append(pokemon.images.small)
                }
            }
        }
    }
}
