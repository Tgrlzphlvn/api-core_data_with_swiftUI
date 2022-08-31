// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let historyInToday = try? newJSONDecoder().decode(HistoryInToday.self, from: jsonData)

import Foundation

// MARK: - HistoryInToday
struct HistoryInToday: Codable {
    let success: Bool?
    let status, pagecreatedate: String?
    let tarihtebugun: [Tarihtebugun]?
}

// MARK: - Tarihtebugun
struct Tarihtebugun: Codable, Identifiable {
    var id = UUID()
    let gun, ay, yil: String?
    let durum: Durum?
    let olay: String?

    enum CodingKeys: String, CodingKey {
        case gun = "Gun"
        case ay = "Ay"
        case yil = "Yil"
        case durum = "Durum"
        case olay = "Olay"
    }
}

enum Durum: String, Codable {
    case doğum = "Doğum"
    case olay = "Olay"
    case ölüm = "Ölüm"
}
