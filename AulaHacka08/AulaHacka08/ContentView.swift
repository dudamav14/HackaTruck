//
//  ContentView.swift
//  AulaHacka08
//
//  Created by Turma02-23 on 13/02/25.
//

import SwiftUI
import MapKit

struct Location: Hashable {
    let nome: String
    let foto: String
    let desc: String
    let latitude: Double
    let longitude:	Double
}

var local = [Location(nome:"Mato Verde",
                      foto:"https://i0.wp.com/guialugaresturisticos.com/wp-content/uploads/2019/05/49303395_298972960818570_2688679293364093424_n.jpg?fit=1078%2C768&ssl=1",
                      desc: "O município está localizado no Norte de Minas Gerais, a 550 metros de altitude, no polígono das secas (semi-árido mineiro), região da Serra Geral. Possui área total de 474,446 km², sendo que a área do perímetro urbano é de 78,5 km². De clima quente e seco, apresenta temperaturas médias entre 20° e 30°. Em 2004, o número de eleitores era de 9.117, de uma população total de 13.185 habitantes.",
                      latitude: -15.3966845,
                      longitude: -42.8609082),
             
             Location(nome:"Monte Carmelo",
                      foto:"https://s2-g1.glbimg.com/c0g2gV-UstHMDxbO0crObZ9G3Oc=/0x0:2048x1365/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2021/x/r/LActsASpCagcrjB5HzNg/monte-carmelo.jpg",
                      desc: "Monte Carmelo é um município brasileiro do estado de Minas Gerais. De acordo com o censo realizado em 2022 sua população era de 47 692 habitantes. A principal atividade econômica da cidade é a produção de telhas, tijolos, artefatos cerâmicos e também é destaque na produção de curtume e de embalagens e ainda na produção de café. ",
                      latitude: -18.7150285,
                      longitude: -47.4765108),
             
             Location(nome:"Ipameri",
                      foto:"https://www.goiasturismo.go.gov.br/imagens/destinos/1676312269Rjji06ogsQ.jpg",
                      desc: "Ipameri é um município brasileiro do interior do estado de Goiás, localizado entre os rios Corumbá e São Marcos. Sua população, conforme estimativas do IBGE de 2021, era de 27 365 habitantes. ",
                      latitude: -17.7216988,
                      longitude: -48.1602167),
             
             Location(nome:"Xique-Xique",
                      foto:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN3SiM0hEqPNT21ytBMAGg4mdmiVI_gxisRg&s",
                      desc: "Xique-Xique é um município brasileiro do estado da Bahia, Região Nordeste do país. Está situado à margem direita do Rio São Francisco, que abriga um porto de grande importância para economia da região. A origem do nome Xique-Xique está associada à abundância de cactos do tipo xiquexique encontrados pelos primeiros colonizadores da região.",
                      latitude: -10.8263798,
                      longitude: -42.7437868),
             
             Location(nome:"Montes Claros",
                      foto:"https://upload.wikimedia.org/wikipedia/commons/0/01/MOCcity.jpg",
                      desc: "Montes Claros é um município brasileiro no norte do estado de Minas Gerais. Localiza-se a norte da capital do estado, distando desta cerca de 422 km. Ocupa uma área de 3 589,811 km², sendo que 73,51 km² estão em perímetro urbano. Sua população em 2022 era de 414 240 habitantes, posicionando-se como o quinto mais populoso do estado mineiro. .",
                      latitude: -16.7280758,
                      longitude: -43.9334846)
]

struct ContentView: View {
    @State private var position = MapCameraPosition.region(
    MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: -14.9801674, longitude: -53.9044559), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
)
    @State private var sheet = false
    @State private var selecao: Location =  Location(nome:"Montes Claros",
                                                     foto:"https://upload.wikimedia.org/wikipedia/commons/0/01/MOCcity.jpg",
                                                     desc: "Montes Claros é um município brasileiro no norte do estado de Minas Gerais. Localiza-se a norte da capital do estado, distando desta cerca de 422 km. Ocupa uma área de 3 589,811 km², sendo que 73,51 km² estão em perímetro urbano. Sua população em 2022 era de 414 240 habitantes, posicionando-se como o quinto mais populoso do estado mineiro. .",
                                                     latitude: -16.7280758,
                                                     longitude: -43.9334846)
   
    
    var body: some View {
        
        VStack {
            ZStack(alignment:.top){
                Map(position: $position){
                    ForEach(local, id: \.self){ l in
                        Annotation("", coordinate: CLLocationCoordinate2D(latitude: l.latitude, longitude: l.longitude), content: {
                            Image(systemName: "location.fill")
                                .onTapGesture {
                                sheet.toggle()
                                }
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                                .frame(width: 100,height: 100)
                                .sheet(isPresented:$sheet) {
                                    SheetView(lugar: selecao)
                            }
                        })
                    }
                    
                    
                }
                .ignoresSafeArea()
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 200, height: 40)
                            .cornerRadius(10)
                            .shadow(radius: 9.0)
                            .foregroundColor(.white)
                            
                        Picker(selection: $selecao, label: Text("Selecionar Cidades")) {
                            ForEach(local, id:\.self){ a in
                                Text(a.nome)
                            }.padding()
                        }
                        .pickerStyle(.menu)
                        .accentColor(.black)
                        .padding(.horizontal)
                        .onChange(of: selecao){
                            position =  MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: selecao.latitude, longitude: selecao.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1111, longitudeDelta: 0.1111))
                            )
                        }
                    }
                    
                    Spacer()
                    ZStack{
                        Rectangle()
                            .frame(width: 250, height: 40)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("Melhores cidades do Brasil")
                            .bold()
                        
                    }
                }
            }
            
        }

    }
}

#Preview {
    ContentView()
}
