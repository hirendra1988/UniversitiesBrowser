import CoreData

@MainActor
final class PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {

        guard
            let modelURL = Bundle.module.url(
                forResource: "Universities",
                withExtension: "momd"
            ),
            let model = NSManagedObjectModel(contentsOf: modelURL)
        else {
            fatalError("Could not load Universities.xcdatamodeld")
        }

        container = NSPersistentContainer(
            name: "Universities",
            managedObjectModel: model
        )

        if inMemory {
            container.persistentStoreDescriptions.first?.url =
                URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error {
                print("Failed to load persistent store: \(error)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy =
            NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
    }
}
