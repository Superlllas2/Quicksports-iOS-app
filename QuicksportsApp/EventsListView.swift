import SwiftUI

struct EventsListView: View {
    private let columns = [GridItem(.adaptive(minimum: 360), spacing: 16)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(Match.sampleMatches) { match in
                    MatchCardView(match: match)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Explore")
    }
}

struct MatchCardView: View {
    let match: Match

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: match.locationImageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(_):
                    placeholder
                case .empty:
                    placeholder
                @unknown default:
                    placeholder
                }
            }
            .frame(width: 96, height: 96)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(match.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(match.formattedDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 8) {
                    PillView(text: match.city, icon: "mappin.and.ellipse")
                    PillView(text: "3", style: .secondary)
                        .frame(height: 24)
                }

                HStack(spacing: 8) {
                    PillView(text: match.playersText, icon: "person.2.fill", style: .info)
                    PillView(text: match.status.rawValue, style: match.status == .confirmed ? .success : .warning)
                    PillView(text: "€\(match.formattedPrice)", icon: "eurosign.circle.fill", style: .info)
                    PillView(text: "\(match.formattedDuration) h", icon: "clock.fill", style: .neutral)

                    if let discount = match.discountPercent, let oldPrice = match.oldPrice {
                        DiscountPillView(discount: discount, oldPrice: oldPrice)
                    }
                }
            }
            Spacer(minLength: 0)
        }
        .padding(14)
        .background(Color(.systemBackground))
        .overlay(alignment: .topTrailing) {
            Image(systemName: "volleyball.fill")
                .foregroundColor(Color(.systemGray4))
                .padding(10)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }

    private var placeholder: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color(.systemGray5))
    }
}

struct PillView: View {
    enum Style {
        case neutral
        case warning
        case success
        case info
        case secondary

        var foreground: Color {
            switch self {
            case .neutral, .secondary: return .primary
            case .warning: return Color(.sRGB, red: 0.54, green: 0.37, blue: 0.02, opacity: 1)
            case .success: return Color(.sRGB, red: 0.11, green: 0.48, blue: 0.21, opacity: 1)
            case .info: return Color(.sRGB, red: 0.07, green: 0.33, blue: 0.62, opacity: 1)
            }
        }

        var background: Color {
            switch self {
            case .neutral: return Color(.systemGray5)
            case .warning: return Color(.systemYellow).opacity(0.25)
            case .success: return Color(.systemGreen).opacity(0.2)
            case .info: return Color(.systemBlue).opacity(0.15)
            case .secondary: return Color(.systemGray5)
            }
        }
    }

    var text: String
    var icon: String? = nil
    var style: Style = .neutral

    var body: some View {
        HStack(spacing: 4) {
            if let icon {
                Image(systemName: icon)
                    .font(.caption)
            }
            Text(text)
                .font(.caption)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(style.background)
        .foregroundColor(style.foreground)
        .clipShape(Capsule())
    }
}

struct DiscountPillView: View {
    let discount: Int
    let oldPrice: Double

    var body: some View {
        HStack(spacing: 4) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Save \(discount)% Off")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("€\(String(format: "%.0f", oldPrice))")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .strikethrough()
            }
            .padding(.leading, 10)
            .padding(.vertical, 6)
        }
        .padding(.trailing, 10)
        .background(Color(.systemBlue).opacity(0.15))
        .foregroundColor(Color(.systemBlue))
        .clipShape(Capsule())
    }
}

#Preview {
    NavigationStack {
        EventsListView()
    }
}
