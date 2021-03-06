//
//  ContentView.swift
//  pokemoncardtgclab10
//
//  Created by Cesar Merlo on 6/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var querySearch: String = "";
    
    var body: some View {
        ZStack(alignment: .center){
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Pokémon TCG Guru")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("The Ultimate Pokémon Card Database")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.bottom)
                TextField("Search for a card", text: $querySearch)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                Button(action: {}, label: {
                        Text("Buscar")
                            .font(.title2)
                })
            }
            VStack{
                Spacer()
                Text("Pokémon TCG Guru by Andrew Backes")
                    .font(.footnote)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
