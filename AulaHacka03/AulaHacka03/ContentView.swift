//
//  ContentView.swift
//  AulaHacka03
//
//  Created by Turma02-23 on 06/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            HStack{
                
                Image("doguinho")
                    .resizable()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                
                VStack{
                    HStack(spacing:12){
                        VStack{
                            Text("8")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Posts")
                                .scaledToFill()
                        }
                        
                        VStack{
                            Text("12k")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Seguidores")
                                .scaledToFill()
    
                        }
                        VStack{
                            Text("2k")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Seguindo")
                                .scaledToFill()
                                
                        }
                        
                    }
                    HStack{
                        Text("Editar Perfil")
                            .frame(width:250, height:40)
                            .background(.gray)
                            .cornerRadius(8)
                    }
                }
            }

            VStack{
                HStack{
                    Text("Duda Mendes")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                HStack{
                    Text("Lorem Ipsum bla bla bla bla")
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
            }.padding()
            
           Divider()
            HStack(spacing:100){
                Image(systemName:"square.grid.3x3.fill")
                    .imageScale(.large)
                
                Image(systemName:"square.stack.fill")
                    .imageScale(.large)
                
                Image(systemName:"person.2.circle.fill")
                    .imageScale(.large)
            }.padding()
            Divider()
            VStack{
                HStack{
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                }
                
                HStack{
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                }
                HStack{
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.gray)
                }
                
            }
        }
        .padding()
        }
    }


#Preview {
    ContentView()
}
