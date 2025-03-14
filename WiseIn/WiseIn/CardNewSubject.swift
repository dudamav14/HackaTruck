//
//  CardNewSubject.swift
//  WiseIn
//
//  Created by Turma02-23 on 12/03/25.
//

import SwiftUI

struct AddMateriaView: View {
    @State var materia : Subject?
    @Binding  var nomePessoa: String
    @State private var nomeMateria: String = ""
   
    @State private var showingSheet = false
    @State private var selecao: Tipos = Tipos(nome: "Ensino Fundamental", nivel: 1)
    @FocusState private var isFocused: Bool
    @State var hour: Int = 0
    
    @State private var timer: Timer? = nil
    @State private var lastEdited = Date()
    
    @StateObject var vm = viewModelMateria()
    @StateObject var vmGemini = GeminiQuizViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                
                VStack(spacing: 20) {
                    Text("Agora queremos \nconhecer você!")
                        .font(.title)
                        .bold()
                        .foregroundColor(.lightActive)
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Nome:")
                            .foregroundColor(.darker)
                        TextField("Insira seu nome", text: $nomePessoa)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .frame(width: 320)
                    }
                    
                    
                    
                    HStack {
                        Text("Tipo de estudo:")
                            .foregroundColor(.darker)
                        Picker(selection: $selecao, label: Text("Selecionar tipo")) {
                            ForEach(tipoEst, id: \.self) { tipo in
                                Text(tipo.nome)
                            }
                        }
                        .pickerStyle(.menu)
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(width: 200)
                        .accentColor(.dark)
                    }
                    
                    HStack(spacing: 15) {
                        ForEach(1..<5) { h  in
                            
                            Button(action: {
                                self.hour = h
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.light)
                                        .cornerRadius(8)
                                    VStack(spacing: -5) {
                                        Text("\(h)")
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(.darkActive)
                                        Text(h == 1 ? "Hora" : "Horas")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.darker)
                                    }
                                }
                            })
                            
                            
                        }
                    }
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Nome da Matéria:")
                                .foregroundColor(.darker)
                            TextField("Insira o nome da matéria", text: $nomeMateria).focused($isFocused)
                                .onChange(of: nomeMateria) { n in
                                    timer?.invalidate()
                                    
                                    // Atualiza a última data de edição
                                    lastEdited = Date()
                                    
                                    // Cria um novo timer para executar a ação após 3 segundos
                                    timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                        if Date().timeIntervalSince(lastEdited) >= 3 {
                                          
                                            vmGemini.prompt(materia: nomeMateria, nivel: selecao.nome, quantidade: hour)
                                        }
                                    }
                                    
                                
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    VStack(spacing: 20) {
                        
                        NavigationLink(destination:Home(nome: nomePessoa)){
                            
                                
                                Text("Começar")
                                    .padding()
                                    .foregroundColor(.light)
                                    .background(Color.darker.opacity(0.2))
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                            
                        }
                        
                        
                    }
                    .accentColor(.darker)
                    
                }
            }
        }
    }
}


