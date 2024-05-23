//
//  Title.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct Title: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

#Preview {
    Title(title: "Título")
        .padding(.horizontal)
}
