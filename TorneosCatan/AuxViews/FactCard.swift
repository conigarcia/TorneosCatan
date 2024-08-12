//
//  FactCard.swift
//  TorneosCatan
//
//  Created by coni garcia on 12/08/2024.
//

import SwiftUI

struct FactCard: View {
    let fact: String?
    let primaryDescription: String?
    let secondaryDescription: String?
    let color: Color
    
    var body: some View {
        GroupBox {
            VStack {
                if let f = fact {
                    Text(f)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(color))
                        .contentTransition(.numericText())
                }
                if let pd = primaryDescription {
                    Text(pd)
                        .font(.subheadline.smallCaps())
                        .foregroundStyle(Color(.secondaryLabel))
                }
                if let sd = secondaryDescription {
                    Text(sd)
                        .font(.caption)
                        .foregroundStyle(Color(.tertiaryLabel))
                        .contentTransition(.numericText())
                }
            }
            .frame(width: 140, height: 70)
        }
        .groupBoxStyle(.TCGroupBoxStyle)
    }
}

#Preview {
    FactCard(
        fact: "18",
        primaryDescription: "puntos promedio",
        secondaryDescription: nil,
        color: Color(.accent)
    )
}
