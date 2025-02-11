//
//  ContentView.swift
//  AulaHacka01
//
//  Created by Turma02-23 on 05/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Rectangle()
                    .size(width: 80.0, height:80.0)
                    .foregroundColor(.red)
                Spacer(minLength: 200)
                Rectangle()
                    .size(width: 80.0, height:80.0)
                    .foregroundColor(.blue)
            }
            Spacer(minLength: 600)
            HStack{
                Rectangle()
                    .size(width: 80.0, height:80.0)
                    .foregroundColor(.green)
                Spacer(minLength: 200)
                Rectangle()
                    .size(width: 80.0, height:80.0)
                    .foregroundColor(.yellow)
            }
            
        }.padding()
    }
        
}
#Preview {
    ContentView()
}
