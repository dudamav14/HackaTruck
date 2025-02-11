//
//  Modo1.swift
//  AulaHacka06
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct Modo1: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.preto
                    .ignoresSafeArea()
                VStack{
                    Text("MODO 1")
                        .foregroundColor(.white)
                    ZStack(alignment:.center){
                        Rectangle()
                            .frame(width: 250, height: 150)
                            .foregroundColor(.pink)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        VStack{
                            Text("Nome: Duda")
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Sobrenome: Mendes")
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    Modo1()
}
