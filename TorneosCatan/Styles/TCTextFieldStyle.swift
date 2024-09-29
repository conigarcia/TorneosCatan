//
//  TCTextFieldStyle.swift
//  TorneosCatan
//
//  Created by coni garcia on 18/05/2024.
//

import SwiftUI

struct TCTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading)
            .frame(height: 50)
            .background(Color(.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    @Previewable @State var input = ""
    
    return TextField(text: $input, prompt: Text("Escriba algo")) {}
        .textFieldStyle(TCTextFieldStyle())
        .padding()
}
