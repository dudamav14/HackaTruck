import SwiftUI
import Speech

struct TelaAnotacoes: View {
    @State private var notas: String = "Dom Pedro II foi imperador do Brasil entre 1840 a 1889. A partir daí, iniciou-se a República Brasileira."
    @State private var gravando = false
    private let reconhecimentoFala = ReconhecimentoFala()
    @StateObject private var geminiVM = GQuizViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.lightActive.opacity(0.95), Color.normal, Color.normalActive, Color.dark, Color.darkActive]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                VStack {
                    Image("LogoWisein")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .padding(.top, 20)
                    
                    Text("ANOTAÇÕES")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    
                    // Botão de Transcrição
                    Button(action: {
                        if gravando {
                            reconhecimentoFala.stopTranscribing()
                            gravando = false
                        } else {
                            reconhecimentoFala.transcribe { result in
                                self.notas += result + " "
                            }
                            gravando = true
                        }
                    }) {
                        HStack {
                            Image(systemName: gravando ? "mic.slash.fill" : "mic.fill")
                                .foregroundColor(.white)
                            Text(gravando ? "Parar" : "Transcrever Áudio")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(gravando ? Color.red : Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    }
                    
                    // Botões de Resumo e Questões
                    HStack {
                        Button(action: {
                            sendToNodeRED(type: "resumo", text: notas)
                        }) {
                            Text("Resumir")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            sendToNodeRED(type: "questoes", text: notas)
                        }) {
                            Text("Questões")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Área de Notas
                    VStack {
                        TextEditor(text: $notas)
                            .frame(height: 100)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                            .padding(.horizontal, 20)
                        
                        Button("Gerar Resumo") {
                            geminiVM.getResponse(notas: notas)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.top, 10)
                        
                        // Exibição do Resumo
                        if !geminiVM.resumo.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Resumo Gerado:")
                                    .font(.headline)
                                    .padding(.top)

                                Text(geminiVM.resumo)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 3)
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    // Botão de Adicionar à Disciplina
                    Button(action: {
                        saveNote()
                    }) {
                        HStack {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.blue)
                            Text("Adicionar à Disciplina")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10.0)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
    }
    
    // Envia texto para o Node-RED
    func sendToNodeRED(type: String, text: String) {
        guard let url = URL(string: "http://127.0.0.1:1880/\(type)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: ["texto": text])
        
        URLSession.shared.dataTask(with: request).resume()
    }
    
    // Salva a anotação localmente (pode ser melhorado para salvar em banco de dados)
    func saveNote() {
        print("Nota salva: \(notas)")
    }
}

// Classe de reconhecimento de voz


struct AnnotationsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

