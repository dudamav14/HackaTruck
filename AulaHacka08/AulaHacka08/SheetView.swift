//
//  SheetView.swift
//  AulaHacka08
//
//  Created by Turma02-23 on 13/02/25.
//

import SwiftUI

struct SheetView: View {
    var lugar : Location = Location(nome:"Mato Verde",
                                    foto:"https://i0.wp.com/guialugaresturisticos.com/wp-content/uploads/2019/05/49303395_298972960818570_2688679293364093424_n.jpg?fit=1078%2C768&ssl=1",
                                    desc: "O município está localizado no Norte de Minas Gerais, a 550 metros de altitude, no polígono das secas (semi-árido mineiro), região da Serra Geral. Possui área total de 474,446 km², sendo que a área do perímetro urbano é de 78,5 km². De clima quente e seco, apresenta temperaturas médias entre 20° e 30°. Em 2004, o número de eleitores era de 9.117, de uma população total de 13.185 habitantes.",
                                    latitude: -15.3966845,
                                    longitude: -42.8609082)
    var body: some View {
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
           
            Rectangle()
                .frame(width: 380,height: 700)
                .foregroundColor(.white)
                .cornerRadius(10)
                    VStack{
                        Image(systemName: "globe.americas")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaledToFit()
                            .foregroundColor(.blue)
                            
                    AsyncImage(url: URL(string: lugar.foto)){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 200, height: 200)
                    
                    Text("\(lugar.nome)")
                        .foregroundStyle(.black)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Text("\(lugar.desc)")
                        .foregroundStyle(.black)
                        .bold()
                }.padding()
            }
        }
    
}

#Preview {
    SheetView()
}
