//
//  WiseInApp.swift
//  WiseIn
//
//  Created by Turma02-23 on 26/02/25.
//

import SwiftUI

@main
struct WiseInApp: App {
    @StateObject var vm = viewModelMateria()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
