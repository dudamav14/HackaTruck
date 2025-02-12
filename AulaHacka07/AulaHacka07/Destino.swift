//
//  Destino.swift
//  AulaHacka07
//
//  Created by Turma02-23 on 12/02/25.
//

import SwiftUI
struct Destino: View {
    var musicaClicada : Song
    
    var body: some View {
        VStack{
            ZStack(alignment: .top){
                Color.black.edgesIgnoringSafeArea(.all)
                LinearGradient(gradient: Gradient(colors: [Color.blue,Color.azul.opacity(0.8), Color.clear]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 500)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    AsyncImage(url: URL(string: musicaClicada.capa)){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 200, height: 200)
                    
                    Text("\(musicaClicada.nome)")
                        .foregroundStyle(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Text("\(musicaClicada.artista)")
                        .foregroundStyle(.white)
                        
                        .bold()
                        
                    HStack{
                       Image(systemName: "shuffle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:30, height: 30)
                            .padding()
                        Spacer()
                        Image(systemName: "backward.end.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:30, height: 30)
                            .padding()
                        Spacer()
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:50, height:50)
                            .padding()
                        Spacer()
                        Image(systemName: "forward.end.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:30, height: 30)
                            .padding()
                        Spacer()
                        Image(systemName: "repeat")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:30, height: 30)
                            .padding()
                            
                    }.padding(80)
                }.padding(80)
                
                
                
                
            }
        }
    }
}

#Preview {
    Destino(musicaClicada: Song(id: 1, nome:"Fear of the Dark", artista: "Iron Maiden", capa:"https://upload.wikimedia.org/wikipedia/pt/6/64/Fear_of_the_dark_-_iron_maiden.jpg"))
}
