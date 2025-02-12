//
//  ContentView.swift
//  AulaHacka07
//
//  Created by Turma02-23 on 12/02/25.
//

import SwiftUI
struct Song: Identifiable{
    var id: Int
    var nome: String
    var artista: String
    var capa: String
}
var songs = [Song(id: 1, nome:"Fear of the Dark", artista: "Iron Maiden", capa:"https://upload.wikimedia.org/wikipedia/pt/6/64/Fear_of_the_dark_-_iron_maiden.jpg"),
             Song(id: 2, nome:"One", artista: "Metallica", capa:"https://i.scdn.co/image/ab67616d0000b273cad68b6356b859430d945773"),
             Song(id: 3, nome:"Solitude", artista: "Black Sabbath", capa:"https://www.mundometalbr.com/wp-content/uploads/2021/10/3ac6f78ed5544b806e22291ab039954c19f083a2r1-1600-1600v2_uhq.jpg"),
             Song(id: 4, nome:"Rooster", artista: "Alice In Chains", capa:"https://i1.sndcdn.com/artworks-I0ERevpLYlMk-0-t500x500.jpg"),
             Song(id: 5, nome:"Where Is My Mind", artista: "Pixies", capa:"https://upload.wikimedia.org/wikipedia/en/3/34/SurferRosa.jpg"),
             Song(id: 6, nome:"Night Moves", artista: "Bob Seger", capa:"https://upload.wikimedia.org/wikipedia/en/0/00/Bob_Seger_-_Night_Moves.jpg"),
             Song(id: 7, nome:"The Calling", artista: "The Fat Rat", capa:"https://i1.sndcdn.com/artworks-000155657401-13kwfy-t500x500.jpg"),
             Song(id: 8, nome:"In My Mind", artista: "Dynoro, Gigi D'Agostino", capa:"https://i.scdn.co/image/ab67616d0000b27328a8a05c3a7ba952c7615ab9"),
             Song(id: 9, nome:"Dust in the Wind", artista: "Kansas", capa:"https://i.scdn.co/image/ab67616d0000b27359f0f56a7cd13526b5b4204c"),
             Song(id: 10, nome:"Nothing Else Matters", artista: "Metallica", capa:"https://universalmusic.vtexassets.com/arquivos/ids/162180/cd-metallica-metallica-metallica-00731451002229-265100222.jpg?v=637310000581300000"),]
struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                ZStack(alignment: .top){
                    Color.black.edgesIgnoringSafeArea(.all)
                    LinearGradient(gradient: Gradient(colors: [Color.blue,Color.azul.opacity(0.8), Color.clear]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 500)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView([.vertical]){
                        VStack{
                            AsyncImage(url: URL(string: "https://universo.paulinas.com.br/imagens/images/pexels-edwardeyer-811838.jpg")){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 250, height: 250)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                            
                            VStack(alignment:.leading){
                                Text("As melhor que tem")
                                    .foregroundStyle(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                   
                                ForEach(songs){ song in
                                    NavigationLink(destination: Destino(musicaClicada: song), label: {
                                        HStack{
                                            AsyncImage(url: URL(string: song.capa)){ image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }.frame(width: 80, height: 80)
                                            VStack(alignment:.leading){
                                                Text(song.nome)
                                                    .bold()
                                                    .font(.title2)
                                                    .foregroundStyle(.white)
                                                Text(song.artista)
                                                    .foregroundStyle(.white)
                                                
                                            }
                                            Spacer()
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.white)
                                        }.padding(.vertical, 8)
                                    })
                                        
                                    
                                }
                                
                                Text("Sugeridos")
                                    .foregroundStyle(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                    .padding()
                            }.padding()
                            ScrollView([.horizontal]){
                                HStack(alignment: .bottom){
                                    VStack{
                                        AsyncImage(url: URL(string: "https://universo.paulinas.com.br/imagens/images/pexels-edwardeyer-811838.jpg")){ image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 250, height: 250)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        .padding()
                                        Text("1-Sla")
                                            .foregroundColor(.white)
                                    }
                                    VStack{
                                        AsyncImage(url: URL(string: "https://universo.paulinas.com.br/imagens/images/pexels-edwardeyer-811838.jpg")){ image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 250, height: 250)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        .padding()
                                        Text("2-Sla")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.tint(.white)
    }
}

#Preview {
    ContentView()
}
