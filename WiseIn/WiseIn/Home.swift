//
//  Home.swift
//  WiseIn
//
//  Created by Turma02-23 on 12/03/25.
//

import SwiftUI

struct Home: View {
    var nome : String
    var body: some View {
        TabView{
            TelaInicial(nome: nome)
                .tabItem {
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house") }
                    )
                    
                }
            
            Agenda()
                .tabItem {
                    Label(
                        title: { Text("Agenda") },
                        icon: { Image(systemName: "calendar") }
                    )
                    
                }
            
            TelaAnotacoes()
                .tabItem {
                    Label(
                        title:{Text("Anotações")},
                        icon:{Image(systemName: "pencil.and.list.clipboard")}
                    )
                }
        }
    }
}

#Preview {
    Home(nome: "teste")
}
