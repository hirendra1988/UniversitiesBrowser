import CoreData
import DomainKit

@MainActor
public final class CoreDataUniversityStore: UniversityStore {

    private let context: NSManagedObjectContext

    public init(context: NSManagedObjectContext) {
        self.context = context
    }

    public convenience init() {
        self.init(
            context: PersistenceController.shared.container.viewContext
        )
    }

    public func fetchAll() async throws -> [University] {
        try context.performAndWait {
            let request: NSFetchRequest<ManagedUniversity> = ManagedUniversity.fetchRequest()
            let entities = try context.fetch(request)

            return entities.map { entity in
                University(
                    id: entity.id ?? "",
                    name: entity.name ?? "",
                    country: entity.country ?? "",
                    stateProvince: entity.stateProvince,
                    alphaTwoCode: entity.alphaTwoCode ?? "",
                    domains: UniversityPersistenceMapper.decode(entity.domains),
                    webPages: UniversityPersistenceMapper.decode(entity.webPages)
                )
            }
        }
    }

    public func save(_ universities: [University]) async throws {
        try context.performAndWait {
            for university in universities {
                let entity = ManagedUniversity(context: context)
                entity.id = university.id
                entity.name = university.name
                entity.country = university.country
                entity.stateProvince = university.stateProvince
                entity.alphaTwoCode = university.alphaTwoCode
                entity.domains = UniversityPersistenceMapper.encode(university.domains)
                entity.webPages = UniversityPersistenceMapper.encode(university.webPages)
            }

            if context.hasChanges {
                try context.save()
            }
        }
    }

    public func removeAll() async throws {
        try context.performAndWait {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedUniversity")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            try context.execute(deleteRequest)

            if context.hasChanges {
                try context.save()
            }
        }
    }

    public func replaceAll(with universities: [University]) async throws {
        try await removeAll()
        try await save(universities)
    }
}
