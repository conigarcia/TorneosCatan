import SwiftUI

struct MultiSelectionView<Selectable: Identifiable & Hashable>: View {
    let message: String
    
    let options: [Selectable]
    let optionToString: (Selectable) -> String

    @Binding var selected: Set<Selectable>

    var body: some View {
        List {
            Section(message) {
                ForEach(options) { selectable in
                    Button {
                        toggleSelection(selectable: selectable)
                    } label: {
                        HStack {
                            Text(optionToString(selectable))
                                .foregroundStyle(Color(.label))
                            
                            Spacer()
                            
                            if selected.contains(where: { $0.id == selectable.id }) {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                    .tag(selectable.id)
                }
            }
        }
    }

    private func toggleSelection(selectable: Selectable) {
        if let existingIndex = selected.firstIndex(where: { $0.id == selectable.id }) {
            selected.remove(at: existingIndex)
        } else {
            selected.insert(selectable)
        }
    }
}

struct MultiSelectionView_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }

    @State static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

    static var previews: some View {
        NavigationView {
            MultiSelectionView(
                message: "select multiple options",
                options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                optionToString: { $0.string },
                selected: $selected
            )
        }
    }
}
