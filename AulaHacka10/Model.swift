//
//  Model.swift
//  AulaHacka10
//
//  Created by Turma02-23 on 19/02/25.
//

import Foundation

struct CatJogos: Decodable, Hashable{
    let  _id: String
    let _rev: String
    let nomeCategoria: String
    let jogos : Jogos
}

struct Jogos: Decodable,Hashable{
    let nome: String
    let produtora: String
    let descricaoJogo: String
    let anoLancamento: Int
    let ehsequencia: Bool
}

