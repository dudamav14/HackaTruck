//
//  File.swift
//  WiseIn
//
//  Created by Turma02-23 on 28/02/25.
//

import Foundation


//struct Materia : Codable{
//    var _id : String?
//    var _rev : String?
//    var nome : String
//    var horas : Int
//    var timestamp : String?
//}



class viewModelMateria : ObservableObject{
    @Published var materias : [Subject] = []
    
    func postMateria(materia : Subject){
        
        let url = URL(string: "http://127.0.0.1:1880/salvarMateria")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(materia)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao salvar matéria: \(error)")
            } else {
                print("Matéria salva com sucesso!")
            }
        }.resume()
    }
    
    
    func fetch(){
        
        URLSession.shared.dataTask(with: URL(string:  "http://127.0.0.1:1880/getMateria")!) { data, response, error in
            do{
                self.materias = try JSONDecoder().decode([Subject].self, from: data!)
                
            }catch{
                print (error)
            }
            
            
            if let error = error {
                print("Erro ao salvar matéria: \(error)")
            } 
        }.resume()
    }
    
}
