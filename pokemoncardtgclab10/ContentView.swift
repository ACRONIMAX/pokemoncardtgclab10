//
//  ContentView.swift
//  pokemoncardtgclab10
//
//  Created by Cesar Merlo on 6/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var querySearch: String = "";
    let emptyImageUrl: String = "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg"
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                VStack{
                    Text("Pokémon TCG Guru")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("The Ultimate Pokémon Card Database")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.bottom)
                    TextField("Search for a card", text: $querySearch)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .accentColor(Color.blue)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.horizontal, 40)
                    NavigationLink(destination: pokemonCardView(pokemonName: querySearch, pokemonCardsUrl: [emptyImageUrl])){
                        Text("Buscar")
                            .font(.title3)
                    }
                }
                VStack{
                    Spacer()
                    Text("Pokémon TCG Guru by Andrew Backes")
                        .font(.footnote)
                    Text("Mobile Version: Cesar Merlo")
                        .font(.footnote)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
