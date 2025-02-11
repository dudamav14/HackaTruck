//
//  CinzaView.swift
//  AulaHacka05
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct CinzaView: View {
    var body: some View {
        VStack{
            
            ZStack{
                Color.gray
                    .edgesIgnoringSafeArea(.top)
                Circle()
                    .frame(width:300, height: 300)
                Image(systemName:"paintpalette")
                    .resizable()
                    .frame(width:200, height: 200)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    CinzaView()
}
