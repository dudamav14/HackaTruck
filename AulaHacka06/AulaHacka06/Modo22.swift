//
//  Modo22.swift
//  AulaHacka06
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct Modo22: View {
    var body: some View {
        ZStack{
            Color.preto
                .ignoresSafeArea()
            VStack{
                Text("MODO 2")
                    .foregroundColor(.white)
                    .bold()
                ZStack(alignment:.center){
                    Rectangle()
                        .frame(width: 120, height: 50)
                        .foregroundColor(.pink)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    VStack{
                        Text("Volte,Duda!!")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                       
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Modo22()
}
