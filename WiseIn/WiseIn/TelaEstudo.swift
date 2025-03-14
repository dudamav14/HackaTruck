import SwiftUI

struct TelaEstudo: View {
    @State var subject: Subject // Alterado para @Binding para permitir a modificação
    @State  var remainingTime: CGFloat
    @State  var isPaused = true
    @State  var newTopic: String = ""
    
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "0.00"
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @Binding var progress: Double
    
    @EnvironmentObject var vm: viewModelMateria
    
    @State var topics : [Topic] = []
    
    var body: some View{
        VStack {
            Image(systemName: "book.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.light)
                .frame(height: 100)
                .padding(.top, 20)
                .foregroundColor(.darker)
            
            Text(subject.name.uppercased())
                .font(.title3)
                .fontWeight(.black)
                .padding(.top, 10)
            
            HStack {
                CountdownView(initialHours: Double(subject.time) ?? 0.0) 
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            //            ProgressView(value: remainingTime / TelaEstudo.convertTimeToSeconds(subject.time))
            //                .progressViewStyle(LinearProgressViewStyle(tint: Color(subject.color)))
            //                .frame(height: 10)
            //                .padding(.horizontal, 20)
            
            ProgressView(value: Double(subject.progress), total: 100)
                            .progressViewStyle(LinearProgressViewStyle()) // Barra horizontal
                            .padding()
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Conteúdo")
                    .font(.headline)
                    .italic()
                ScrollView{
                    
                    ForEach(vm.materias.filter({ $0._id == subject._id }), id:\.self){ a in
                        
                        // Text("\(a.topics.count)")
                        
                        ForEach(a.topics, id: \.self) { topic in
                            HStack{
                                Text("• \(topic.name)").strikethrough(topic.isCompleted, color: .gray)
                                    .foregroundColor(topic.isCompleted ? .green : .black)
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    
                                    var a = vm.materias.filter({ $0._id == subject._id})
                                    var indexMateria = vm.materias.firstIndex(where: { $0._id == subject._id})
                                    //                                //print(a.first?.topics.count)
                                    //
                                    //
                                    //
                                    for x in a {
                                        var y = x.topics.firstIndex(where: { $0.name == topic.name })
                                        vm.materias[indexMateria!].topics[y!].isCompleted.toggle()
                                    }
                                    //
                                    print(vm.materias.filter({ $0._id == subject._id}))
                                    
                                    
                                    
                                    
                                    
                                    //                                var cont = 0
                                    //                                for mat in vm.materias[indexMateria!].topics {
                                    //
                                    //
                                    //                                    if topic.isCompleted == true{
                                    //                                        cont += 1
                                    //                                    }
                                    //
                                    //
                                    //                                    progress = Double(vm.materias[indexMateria!].topics.count / cont)
                                    //
                                    //                                    vm.materias[indexMateria!].progress = progress
                                    //
                                    //                                    print(progress)
                                    //                                }
                                    
                                    
                                    
                                    //print(vm.fetch())
                                    //                                if let index =  a[0].topics.firstIndex(where: { $0.name == topic.name }) {
                                    //                                    a[0].topics[index]
                                    //
                                    //                                    let completedTopics = a[0].topics.filter { $0.isCompleted }.count
                                    //                                    let totalTopics = a[0].topics.count
                                    //                                    var pg = CGFloat(completedTopics) / CGFloat(totalTopics)
                                    //
                                    //                                    if let aIndex = vm.materias.firstIndex(where: { $0 == subject}){
                                    //                                        vm.materias[aIndex].progress = pg
                                    //                                        vm.materias[aIndex].topics = a[0].topics
                                    //                                    }
                                    //                                }
                                }) {
                                    Image(systemName: topic.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(topic.isCompleted ? .green : .gray)
                                }
                            }
                        }
                    }
                    
                   
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // Adicionando campo para adicionar novo tópico
            HStack {
                TextField("Novo tópico", text: $newTopic)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                
                Button(action: {
                    if !newTopic.isEmpty {
                        
                        subject.topics = []
                        
                        let newTopicObj = Topic(name: newTopic, isCompleted: false)
                        subject.topics.append(newTopicObj)
                        newTopic = ""
                    }
                }) {
                    Text("Adicionar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.darker)
                        .cornerRadius(5)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            Spacer()
        }.onAppear(){
            vm.fetch()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(subject.color).opacity(0.2).edgesIgnoringSafeArea(.all))
        //        .onDisappear {
        //            stopTimer()
        //        }
    }
    
    
    
    private static func convertTimeToSeconds(_ time: String) -> CGFloat {
        let components = time.components(separatedBy: " ")
        if let value = Int(components.first ?? "0"), components.last?.lowercased().contains("hora") == true {
            return CGFloat(value * 3600)
        } else if let value = Int(components.first ?? "0"), components.last?.lowercased().contains("min") == true {
            return CGFloat(value * 60)
        }
        return 0
    }
    
    private static func formatTime(_ seconds: CGFloat) -> String {
        let hours = Int(seconds) / 3600
        let minutes = (Int(seconds) % 3600) / 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, secs)
    }
}


struct CountdownView: View {
    let initialHours: Double
    @State private var secondsRemaining: Int
    @State private var timer: Timer? = nil
    @State private var isPaused = false
    
    init(initialHours: Double) {
        self.initialHours = initialHours
        // Converte as horas em segundos
        self._secondsRemaining = State(initialValue: Int(initialHours * 3600))
    }
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(systemName: "clock")
                .font(.title2)
            
            
            // Exibe o tempo restante formatado (hh:mm:ss)
            Text(timeString(from: secondsRemaining))
                .font(.system(size: 20, design: .monospaced))
                .padding()
            
            // Botão para pausar ou retomar a contagem
            
            Image(systemName: isPaused ? "play.fill" : "pause.fill")
                .font(.title)
                .foregroundColor(.darker) .onTapGesture {
                    
                    togglePause()
                }
            
        }
        .onAppear(perform: startTimer)
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    // Inicia o timer que decrementa os segundos restantes a cada 1 segundo
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if !isPaused {
                if secondsRemaining > 0 {
                    secondsRemaining -= 1
                } else {
                    timer?.invalidate()
                }
            }
        }
    }
    
    // Alterna entre pausar e retomar a contagem
    private func togglePause() {
        isPaused.toggle()
    }
    
    // Formata os segundos restantes em "hh:mm:ss"
    private func timeString(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let secs = seconds % 60
        return String(format: "%02dh:%02dm:%02ds", hours, minutes, secs)
    }
}
