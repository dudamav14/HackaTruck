//
//  Modo2.swift
//  AulaHacka06
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct Modo2: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.preto
                    .ignoresSafeArea()
                VStack{
                    Text("MODO 2")
                        .foregroundColor(.white)
                        .bold()
                    ZStack(alignment:.center){
                        Rectangle()
                            .frame(width: 250, height: 150)
                            .foregroundColor(.pink)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        VStack{
                            Text("Duda")
                                .foregroundColor(.white)
                            Text("Bem-Vinda,Duda")
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            NavigationLink(destination:Modo22()){
                                ZStack{
                                    Rectangle()
                                        .frame(width: 120, height: 40)
                                        .foregroundColor(.blue)
                                        .cornerRadius(10)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    Text("Acessar Tela")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                    }
                }
             }
            }
        }
}

#Preview {
    Modo2()
}
