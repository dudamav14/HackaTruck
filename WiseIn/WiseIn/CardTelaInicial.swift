import SwiftUI

struct CardTelaInicial: View {
    var subject: Subject
    @State var progress: Int
    
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    VStack(alignment: .leading){
                        Text(subject.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        Text("\(subject.time) Horas")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    VStack(alignment: .leading){
                        HStack{
                            Spacer()
                            Text("\(subject.progress, specifier: "%.0f") %")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                        }
                    }
                }
                HStack{
                    
                    ProgressView(value: Double(subject.progress), total: 100)
                                    .progressViewStyle(LinearProgressViewStyle()) // Barra horizontal
                                    .padding()
                    
//                    // Barra de progresso com borda e efeito de sombra
//                    ProgressView(value: Double(progress), total: 1)
//                        .progressViewStyle(LinearProgressViewStyle(tint: Color(subject.color)))
//                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ )
//                        .padding(10)
//                        .background(Color(subject.color).opacity(0.3)) // Mantém o fundo mais suave da barra
//                        .cornerRadius(10)
//                        .shadow(radius: 5)
                }
            }
            
            
            Spacer()


        }.onAppear(){
            progress = Int.random(in: 0...10)*10
        }
        .padding()
        .background(
            Color.black.opacity(0.6) // Cor de fundo do card com opacidade, para contraste
        )
        .cornerRadius(15)
        .shadow(radius: 10) // Sombras mais profundas para destacar o card
        .padding(.horizontal) // Adiciona um pouco de espaçamento nas laterais
    }
}

//struct StudyCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CardTelaInicial(subject: Subject(
//            name: "Matemática Discreta",
//            time: "2 Horas",
//            progress: 0.4,
//            color: "red",
//            topics: [Topic(name: "Conjuntos", isCompleted: false), Topic(name: "Teoria dos Grafos", isCompleted: false)]
//        ))
//        .previewLayout(.sizeThatFits)
//        .padding()
//    }
//}
