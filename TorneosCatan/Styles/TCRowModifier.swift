//
//  TCRowModifier.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct Row: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color(.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
    }
}

extension View {
    func rowStyle() -> some View {
        modifier(Row())
    }
}

#Preview {
    HStack {
        Text("Some text")
        Spacer()
    }
    .rowStyle()
}
