//
//  TCGroupBoxStyle.swift
//  TorneosCatan
//
//  Created by coni garcia on 12/08/2024.
//

import SwiftUI

struct TCGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            configuration.content
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(.rect(cornerRadius: 10))
    }
}

extension GroupBoxStyle where Self == TCGroupBoxStyle {
    static var TCGroupBoxStyle: TCGroupBoxStyle { .init() }
}

#Preview {
    GroupBox {
        Text("Some text")
    }
    .groupBoxStyle(.TCGroupBoxStyle)
}
