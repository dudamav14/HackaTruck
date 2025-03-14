import Foundation

// Chave da API (substitua por uma variável de ambiente para segurança)
let apiKey2 = "AIzaSyBRaN2Iki2Xcy-wwe06xsg20mUsdvKwvUE"
let baseURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=\(apiKey2)"

//struct Request: Codable {
//    let contents: [RequestContent]
//}

//struct RequestContent: Codable {
//    let parts: [Prompt]
//}

//struct Prompt: Codable {
//    let text: String
//}

//struct GeminiResponse: Codable {
//    struct CandidateResponse: Codable {
//        let content: ContentResponse
//        
//        struct ContentResponse: Codable {
//            let parts: [Prompt]
//        }
//    }
//    let candidates: [CandidateResponse]
//}

class GQuizViewModel: ObservableObject {
    
    @Published var resumo: String = ""
    @Published var questoes: [String] = [] // Adicionado para evitar o erro

    func getResponse(notas: String) {
        let promptTexto = "Resuma o seguinte texto de forma clara e objetiva:\n\n\(notas)"
        let requestBody = Request(contents: [RequestContent(parts: [Prompt(text: promptTexto)])])
        
        guard let url = URL(string: baseURL) else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(requestBody)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Erro na requisição: \(error?.localizedDescription ?? "Erro desconhecido")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(GeminiResponse.self, from: data)
                if let resumoTexto = decodedResponse.candidates.first?.content.parts.first?.text {
                    DispatchQueue.main.async {
                        self?.resumo = resumoTexto
                    }
                }
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
        }
        
        task.resume()
    }
    
    func getQuestoes() {
        guard !resumo.isEmpty else { return }

        let prompt = "Gere 3 questões de múltipla escolha sobre o seguinte resumo:\n\n\(resumo)"
        fetchData(prompt: prompt) { [weak self] response in
            DispatchQueue.main.async {
                self?.questoes = response.components(separatedBy: "\n").filter { !$0.isEmpty }
            }
        }
    }

    private func fetchData(prompt: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: baseURL) else {
            print("URL inválida")
            return
        }

        let requestBody = Request(contents: [RequestContent(parts: [Prompt(text: prompt)])])
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(requestBody)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("Erro na requisição: \(error?.localizedDescription ?? "Erro desconhecido")")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(GeminiResponse.self, from: data)
                if let responseText = decodedResponse.candidates.first?.content.parts.first?.text {
                    completion(responseText)
                } else {
                    print("Erro: resposta vazia ou mal formatada")
                }
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
        }

        task.resume()
    }
}

