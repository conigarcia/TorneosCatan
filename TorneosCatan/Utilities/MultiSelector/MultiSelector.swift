// Copyright © 2020 Flinesoft. All rights reserved.

import SwiftUI

struct MultiSelector<LabelView: View, Selectable: Identifiable & Hashable>: View {
    let label: LabelView
    let message: String
    let options: [Selectable]
    let optionToString: (Selectable) -> String

    var selected: Binding<Set<Selectable>>

    private var formattedSelectedListString: String {
        ListFormatter.localizedString(byJoining: selected.wrappedValue.map { optionToString($0) })
    }

    var body: some View {
        NavigationLink(destination: multiSelectionView()) {
            HStack {
                VStack(alignment: .leading) {
                    label
                        .padding(.bottom, 5)
                        .foregroundStyle(Color(.label))
                    
                    if !formattedSelectedListString.isEmpty {
                        Text(formattedSelectedListString)
                            .foregroundStyle(Color(.secondaryLabel))
                            .multilineTextAlignment(.leading)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.forward")
                    .foregroundStyle(Color(.tertiaryLabel))
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 10))
        }
    }

    private func multiSelectionView() -> some View {
        MultiSelectionView(
            message: message,
            options: options,
            optionToString: optionToString,
            selected: selected
        )
    }
}

struct MultiSelector_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }

    @State static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

    static var previews: some View {
        NavigationStack {
            MultiSelector<Text, IdentifiableString>(
                label: Text("Multiselect"),
                message: "select multiple options",
                options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                optionToString: { $0.string },
                selected: $selected
            )
            .navigationTitle("Title")
        }
    }
}
