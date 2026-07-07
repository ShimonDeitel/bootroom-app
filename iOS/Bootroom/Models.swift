import Foundation

struct GearItemEntry: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var brand: String
    var category: String
    var purchaseDate: String
    var notes: String = ""
    var createdAt: Date = Date()
}
