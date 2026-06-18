import Foundation

enum UniversityPersistenceMapper {

    static func encode(_ value: [String]) -> Data? {
        try? JSONEncoder().encode(value)
    }

    static func decode(_ data: Data?) -> [String] {
        guard let data else {
            return []
        }

        return (try? JSONDecoder().decode([String].self, from: data)) ?? []
    }
}
