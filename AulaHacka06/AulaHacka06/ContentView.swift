//
//  ContentView.swift
//  AulaHacka06
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI


struct ContentView: View {
    @State private var sheet = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color.preto
                    .ignoresSafeArea()
                
                VStack(alignment: .center){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding(30)
                    NavigationLink(destination: Modo1()){
                        ZStack{
                            Rectangle()
                                .frame(width: 200, height: 80)
                                .foregroundColor(.pink)
                                .cornerRadius(10)
                            Text("Modo 1")
                                .foregroundColor(.white)
                        }
                    }
                    NavigationLink(destination: Modo2()){
                        ZStack{
                            Rectangle()
                                .frame(width: 200, height: 80)
                                .foregroundColor(.pink)
                                .cornerRadius(10)
                            Text("Modo 2")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button("Modo 3"){
                        sheet.toggle()
                    }.padding()
                        .buttonStyle(.bordered)
                        .frame(width: 200,height: 80)
                        .background(Color.pink)
                        .clipShape(Rectangle())
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .sheet(isPresented:$sheet) {
                            SheetView()
                        } .frame(width: 200, height: 80)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                
            }
        }
    }
}



#Preview {
    ContentView()
}
