import Foundation

// Defina sua chave de API
let apiKey = "AIzaSyB9eZ930HL5Ghm9Mqqjtd-l2_nhO-y00Gs"
let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=\(apiKey)")!


struct Request: Codable {
    let contents: [RequestContent]
}

struct RequestContent: Codable {
    let parts: [Prompt]
}

struct Prompt: Codable {
    let text: String
}

struct GeminiResponse: Codable {
    struct CandidateResponse: Codable {
        let content: ContentResponse
        
        struct ContentResponse : Codable{
            let parts : [Prompt]
        }
    }
    let candidates: [CandidateResponse]
}




class GeminiQuizViewModel : ObservableObject {
    
    @Published var topics : [Topic] = []
    @Published var arrayAlternativas : [String] = []
    var vm = viewModelMateria()
    
    
    func getResponse(_ prompt : String, nomeMateria : String, time: Int){
        
        let requestBody = Request(contents: [RequestContent(parts: [Prompt(text: prompt)])])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(requestBody)
        // Fazer a requisição
        let task = URLSession.shared.dataTask(with: request) { [self] data, _, error in
            
            if let decodedResponse = try? JSONDecoder().decode(GeminiResponse.self, from: data!) {
                var jsonString = decodedResponse.candidates.first?.content.parts.first?.text
                
                //print("Resposta do Gemini:", jsonString!)
                jsonStringDecode(jsonString!, nomeMateria: nomeMateria, time: time)
            }
            
        }
        
        task.resume()
        
    }
    
    func jsonStringDecode(_ json : String, nomeMateria : String, time: Int){
        
        var jsonString = json.replacingOccurrences(of: "`json\n", with: "").replacingOccurrences(of: "\n`\n", with: "").replacingOccurrences(of: "`", with: "")
        
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                self.topics = try JSONDecoder().decode([Topic].self, from: jsonData)
                
                
                //                        let materia = Materia(_id: nil, _rev: nil, nome: nomeMateria, horas: horasMateria)
                let materia = Subject(_id: nil,_rev: nil, name: nomeMateria, time: String(time), progress: 0.0, color: "gray", topics: self.topics)
                
                vm.postMateria(materia: materia)
                
                
                print(self.topics)
               
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
        }
    }
//    var name: String
//    var isCompleted: Bool
    
    func prompt(materia : String, nivel: String, quantidade : Int){

        self.getResponse("Preciso de uma lista com \(quantidade) topicos em um array formato json sobre o tema \(materia) no nivel de \(nivel) onde o tópico ira na chave name do objeto, e chave isCompleted virá sempre como boolean false ", nomeMateria: materia, time: quantidade)
        
        //print("Preciso de uma lista com \(quantidade) topicos em um array formato json sobre o tema \(materia) no nivel de \(nivel) onde o tópico ira na chave name do objeto, e chave isCompleted virá sempre como boolean false ")
    }
}
