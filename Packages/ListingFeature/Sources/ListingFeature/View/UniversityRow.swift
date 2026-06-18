import SwiftUI
import DomainKit

struct UniversityRow: View {

    let university: University

    var body: some View {

        HStack(alignment: .top, spacing: 14) {

            Image(systemName: "building.columns.fill")
                .font(.system(size: 24))
                .foregroundStyle(.blue)
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(Color.blue.opacity(0.15))
                )

            VStack(alignment: .leading, spacing: 8) {

                Text(university.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)

                Label(
                    university.country,
                    systemImage: "globe"
                )
                .font(.subheadline)
                .foregroundStyle(.secondary)

                if let state = university.stateProvince,
                   !state.isEmpty {

                    Label(
                        state,
                        systemImage: "location.fill"
                    )
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.tertiary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    Color.primary.opacity(0.08),
                    lineWidth: 1
                )
        )
        .shadow(
            color: Color.black.opacity(0.06),
            radius: 8,
            x: 0,
            y: 3
        )
    }
}
