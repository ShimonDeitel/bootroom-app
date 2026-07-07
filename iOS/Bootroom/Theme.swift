import SwiftUI

/// Bespoke palette for Bootroom -- Catalog outdoor gear like boots, tents, and packs with usage counts.
enum Theme {
    static let accent = Color(hex: "#C9622A")
    static let background = Color(hex: "#211712")
    static let backgroundSecondary = Color(hex: "#2B1D15")
    static let card = Color(hex: "#33241A")
    static let textPrimary = Color(hex: "#F5E9DE")
    static let textSecondary = Color(hex: "#D8AF8E")

    static var titleFont: Font { Font.system(.title2, design: .serif).weight(.semibold) }
    static var bodyFont: Font { Font.system(.body, design: .serif) }
    static var captionFont: Font { Font.system(.caption, design: .serif) }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet(charactersIn: "#")))
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
