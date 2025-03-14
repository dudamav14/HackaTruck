import SwiftUI

// Definindo a estrutura de Tópico com 'name' e 'isCompleted'
struct Topic: Hashable, Codable{
    var name: String
    var isCompleted: Bool
}

// Modificação na estrutura Subject para ter uma lista de Topic
struct Subject: Codable, Hashable {
    var _id: String? // Usando o nome como identificador único
    var _rev: String?
    var name: String
    var time: String
    var progress: Double//CGFloat
    var color : String
    var topics: [Topic] // Agora é um array de Topic
}

struct TelaInicial: View {
//    @State private var subjects: [Subject] = [
//        Subject(name: "Matemática Discreta", time: "2 Horas", progress: 0.4, color: .red, topics: [Topic(name: "Conjuntos", isCompleted: false), Topic(name: "Teoria dos Grafos", isCompleted: false)]),
//        Subject(name: "POO", time: "3 Horas", progress: 0.6, color: .yellow, topics: [Topic(name: "Classes", isCompleted: false), Topic(name: "Herança", isCompleted: false)]),
//        Subject(name: "Hacka Truck", time: "5 Horas", progress: 1.0, color: .green, topics: [Topic(name: "Desafio 1", isCompleted: false), Topic(name: "Desafio 2", isCompleted: false)])
//    ]
    
    @EnvironmentObject var vm : viewModelMateria
    
    @State  var showAddSubjectForm: Bool = false
    @State  var newSubjectName: String = ""
    @State  var newSubjectTime: String = ""
    @State  var newTopicName: String = "" // Nome do novo tópico a ser adicionado
    
    @State var progress: Double = 0.0
    
    var nome = ""
    
    var body: some View {
        NavigationStack{
            
            ZStack {
                // Plano de fundo
                LinearGradient(gradient: Gradient(colors: [Color.lightActive.opacity(0.95), Color.normal, Color.normalActive, Color.dark, Color.darkActive]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.top)
                ScrollView {
                    VStack {
                        // Cabeçalho com ícone e saudação
                        Image(systemName: "book.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.darker)
                            .frame(width: 120, height: 120)
                            .padding(.top, 40)
                        
                        Text("Bem-vindo, \(nome)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        // ScrollView para matérias
                        
                        VStack(spacing: 15) {
                            ForEach(vm.materias, id: \.self) { mat in
                                NavigationLink(destination: TelaEstudo(subject: mat, remainingTime: 0.0, progress: $progress)) {
                                    CardTelaInicial(subject: mat, progress: Int(mat.progress)) // Você vai precisar dessa view também
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        
                        // Botão para adicionar nova matéria
                        Button(action: {
                            showAddSubjectForm.toggle()
                        }) {
                            Text("Adicionar Matéria")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding()
                        
                        
                        // Formulário de adição de matéria
                        if showAddSubjectForm {
                            VStack(spacing: 15) {
                                TextField("Nome da matéria", text: $newSubjectName)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(.horizontal)
                                
                                TextField("Tempo (ex: 1 Hora)", text: $newSubjectTime)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(.horizontal)
                                
                                TextField("Adicionar tópico de estudo", text: $newTopicName)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(.horizontal)
                                
                                Button(action: {
                                    if !newSubjectName.isEmpty && !newSubjectTime.isEmpty {
                                        // Criando um novo tópico a partir do nome do tópico inserido
                                        let newTopic = Topic(name: newTopicName, isCompleted: false)
                                        let newSubject = Subject(
                                            name: newSubjectName,
                                            time: newSubjectTime,
                                            progress: 0.2,
                                            color: "blue",
                                            topics: [newTopic] // Adicionando o novo tópico
                                        )
                                        
                                        vm.postMateria(materia: newSubject)
                                        newSubjectName = ""
                                        newSubjectTime = ""
                                        newTopicName = "" // Limpar o campo de nome de tópico
                                        showAddSubjectForm = false
                                    }
                                }) {
                                    Text("Salvar Matéria")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                                .padding(.horizontal)
                            }
                            .padding(.top, 20)
                        }
                    }
                    .padding()
                    .onAppear(){
                        vm.fetch()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
//    func doubleBinding(subject : Subject) -> Binding<Double> {
//        
//        var completedTopics = subject.topics.filter { $0.isCompleted }.count
//        var totalTopics = subject.topics.count
//        
//        progress = CGFloat(completedTopics) / CGFloat(totalTopics)
//        
//        progress = subject.progress
//        
//           return Binding(
//               get: { self.progress }, // Obtém o valor atual
//               set: { self.progress = $0 } // Define o novo valor
//           )
//       }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15 Pro")
    }
}
