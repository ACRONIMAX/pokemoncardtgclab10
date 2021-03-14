//
//  pokemonData.swift
//  pokemoncardtgclab10
//
//  Created by Cesar Merlo on 14/3/21.
//

import Foundation

struct PokemonCardApi: Decodable {
    var data: [PokemonCardData]
}

struct PokemonCardData: Decodable {
    var id : String
    var name: String
    var images: PokemonCardImages
}

struct PokemonCardImages: Decodable {
    var small: String
}

class PokemonData {
    func getPokemonCards(pokemonName: String, completation: @escaping ([PokemonCardData]) -> ()){
        guard let apiURl = URL(string: "https://api.pokemontcg.io/v2/cards?q=name:\(pokemonName)&pageSize=20") else {
            print("Your Api end point is Invalid")
            return
        }
        let request = URLRequest(url: apiURl)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            if let decoded = try? JSONDecoder().decode(PokemonCardApi.self, from: data) {
                DispatchQueue.main.async {
                    completation(decoded.data)
                }
            }
            print("Fetch failed: \(String(describing: error?.localizedDescription))")
        }.resume()
    }
}
