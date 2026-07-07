import SwiftUI

struct EntrySheet: View {
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss

    var editing: GearItemEntry?

    @State private var name: String = ""
    @State private var field1: String = ""
    @State private var field2: String = ""
    @State private var extraField: String = ""
    @State private var notes: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                        .accessibilityIdentifier("entryNameField")
                    TextField("Brand", text: $field1)
                        .accessibilityIdentifier("entryField1Field")
                    TextField("Category", text: $field2)
                        .accessibilityIdentifier("entryField2Field")
                    TextField("Purchased", text: $extraField)
                        .accessibilityIdentifier("entryExtraField")
                    TextField("Notes", text: $notes, axis: .vertical)
                        .accessibilityIdentifier("entryNotesField")

                }
            }
            .scrollDismissesKeyboard(.interactively)
            .contentShape(Rectangle())
            .onTapGesture { isFocused = false }
            .navigationTitle(editing == nil ? "Add Gear Item" : "Edit Gear Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                        .accessibilityIdentifier("entryCancelButton")
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                        .accessibilityIdentifier("entrySaveButton")
                        .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .onAppear {
                if let e = editing {
                    name = e.name
                    field1 = e.brand
                    field2 = e.category
                    extraField = e.purchaseDate
                    notes = e.notes
                }
            }
        }
    }

    private func save() {
        if var e = editing {
            e.name = name
            e.brand = field1
            e.category = field2
            e.purchaseDate = extraField
            e.notes = notes
            store.update(e)
        } else {
            let entry = GearItemEntry(name: name, brand: field1, category: field2, purchaseDate: extraField, notes: notes)
            store.add(entry)
        }
        dismiss()
    }
}
