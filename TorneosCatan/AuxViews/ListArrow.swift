//
//  ListArrow.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct ListArrow: View {
    var body: some View {
        Image(systemName: "chevron.forward")
            .foregroundStyle(Color(.tertiaryLabel))
            .fontWeight(.semibold)
    }
}

#Preview {
    ListArrow()
}
