//
//  ContentView.swift
//  AulaHacka02
//
//  Created by Turma02-23 on 05/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Image("bla")
                    .resizable()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack(spacing: 10){
                    Text("Hackatruck")
                        .foregroundColor(.red)
                    Text("77 Universidades")
                        .foregroundColor(.blue)
                    Text("5 regiões do Brasil")
                        .foregroundColor(.yellow)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
