//
//  SheetView.swift
//  AulaHacka06
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color.preto
                .ignoresSafeArea()
            
            VStack(){
                Button("Pressione para voltar") {
                    dismiss()
                }
                .padding()
                .background(.preto)
                .padding(10)
                Text("SheetView")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(10)
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
#Preview {
    SheetView()
}
