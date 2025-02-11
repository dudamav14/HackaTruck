//
//  ListaView.swift
//  AulaHacka05
//
//  Created by Turma02-23 on 11/02/25.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush")
                    }
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush.pointed")
                    }
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintpalette")
                    }
                }.navigationTitle("List")
            }
        }
    }
}

#Preview {
    ListaView()
}
