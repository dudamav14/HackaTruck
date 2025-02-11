//
//  AzulView.swift
//  AulaHacka05
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct AzulView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.blue
                    .edgesIgnoringSafeArea(.top)
                Circle()
                    .frame(width:300, height: 300)
                Image(systemName:"paintbrush.pointed")
                    .resizable()
                    .frame(width:200, height: 200)
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    AzulView()
}
