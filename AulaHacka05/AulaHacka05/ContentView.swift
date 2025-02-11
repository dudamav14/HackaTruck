//
//  ContentView.swift
//  AulaHacka05
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            RosaView()
                .tabItem {
                    Label(
                        title: { Text("Rosa") },
                        icon: { Image(systemName: "paintbrush.fill") }
                    )

                }
            AzulView()
                .tabItem {
                    Label(
                        title: { Text("Azul") },
                        icon: { Image(systemName:"paintbrush.pointed.fill") }
                    )
                }
            CinzaView()
                .tabItem {
                    Label(
                        title: { Text("Cinza") },
                        icon: { Image(systemName: "paintpalette.fill") }
                    )
                    
                }
            ListaView()
                .tabItem {
                    Label(
                        title: { Text("Lista") },
                        icon: { Image(systemName: "list.bullet") }
                    )
                }
            
        }
     //   .padding()
    }
}

#Preview {
    ContentView()
}
