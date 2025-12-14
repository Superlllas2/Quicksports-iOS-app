import Foundation

struct Match: Identifiable {
    enum Status: String {
        case pending = "Pending"
        case confirmed = "Confirmed"
    }

    let id: UUID
    let name: String
    let gameDate: Date
    let city: String
    let locationImageURL: URL
    let status: Status
    let minPlayers: Int
    let currentPlayers: Int
    let price: Double
    let durationHours: Double
    let discountPercent: Int?
    let oldPrice: Double?

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm EEE"
        return formatter.string(from: gameDate)
    }

    var playersText: String {
        "\(currentPlayers)/\(minPlayers)"
    }

    var formattedDuration: String {
        if durationHours.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", durationHours)
        }
        return String(format: "%.1f", durationHours)
    }

    var formattedPrice: String {
        if price.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", price)
        }
        return String(format: "%.1f", price)
    }

    static var sampleMatches: [Match] {
        [
            Match(
                id: UUID(),
                name: "Varviksweg Wed - elo 3+",
                gameDate: DateComponents(calendar: .current, year: 2024, month: 12, day: 17, hour: 18, minute: 0).date ?? Date(),
                city: "Enschede",
                locationImageURL: URL(string: "https://images.pexels.com/photos/109969/pexels-photo-109969.jpeg?auto=compress&cs=tinysrgb&w=800")!,
                status: .pending,
                minPlayers: 10,
                currentPlayers: 9,
                price: 4.5,
                durationHours: 2,
                discountPercent: nil,
                oldPrice: nil
            ),
            Match(
                id: UUID(),
                name: "Diekmanhal Fri - elo 3+",
                gameDate: DateComponents(calendar: .current, year: 2024, month: 12, day: 15, hour: 19, minute: 0).date ?? Date(),
                city: "Enschede",
                locationImageURL: URL(string: "https://images.pexels.com/photos/4761666/pexels-photo-4761666.jpeg?auto=compress&cs=tinysrgb&w=800")!,
                status: .confirmed,
                minPlayers: 10,
                currentPlayers: 10,
                price: 6,
                durationHours: 2,
                discountPercent: 25,
                oldPrice: 8
            ),
            Match(
                id: UUID(),
                name: "Pathmoshal Sunday Community Game",
                gameDate: DateComponents(calendar: .current, year: 2024, month: 12, day: 22, hour: 16, minute: 0).date ?? Date(),
                city: "Enschede",
                locationImageURL: URL(string: "https://images.pexels.com/photos/2394507/pexels-photo-2394507.jpeg?auto=compress&cs=tinysrgb&w=800")!,
                status: .pending,
                minPlayers: 10,
                currentPlayers: 0,
                price: 4.5,
                durationHours: 2,
                discountPercent: nil,
                oldPrice: nil
            ),
            Match(
                id: UUID(),
                name: "Community Night - elo 4+",
                gameDate: DateComponents(calendar: .current, year: 2024, month: 12, day: 28, hour: 20, minute: 0).date ?? Date(),
                city: "Enschede",
                locationImageURL: URL(string: "https://images.pexels.com/photos/114296/pexels-photo-114296.jpeg?auto=compress&cs=tinysrgb&w=800")!,
                status: .confirmed,
                minPlayers: 12,
                currentPlayers: 1,
                price: 5,
                durationHours: 1.5,
                discountPercent: nil,
                oldPrice: nil
            ),
            Match(
                id: UUID(),
                name: "Weekend Open Play",
                gameDate: DateComponents(calendar: .current, year: 2024, month: 12, day: 30, hour: 15, minute: 0).date ?? Date(),
                city: "Enschede",
                locationImageURL: URL(string: "https://images.pexels.com/photos/3788232/pexels-photo-3788232.jpeg?auto=compress&cs=tinysrgb&w=800")!,
                status: .pending,
                minPlayers: 10,
                currentPlayers: 8,
                price: 4.5,
                durationHours: 2,
                discountPercent: 25,
                oldPrice: 6
            )
        ]
    }
}
