//
//  Event.swift
//  Trabalho
//
//  Created by Turma02-19 on 11/03/25.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let type: String
    let date: Date
}
