//
//  ViewModel.swift
//  AulaHacka10
//
//  Created by Turma02-23 on 19/02/25.
//

import Foundation

class GamesVM:
    ObservableObject{
    @Published var arrayCategorias: [CatJogos] = []
    
    func fetch(){
        var url = "http://127.0.0.1:1880/lerDados"
        var task = URLSession.shared.dataTask(with: URL(string:url)!){data,_,error in
            do{
                self.arrayCategorias = try JSONDecoder().decode([CatJogos].self, from: data!)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

