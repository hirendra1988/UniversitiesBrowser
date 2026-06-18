import CoreData

extension ManagedUniversity {

    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<ManagedUniversity> {
        NSFetchRequest<ManagedUniversity>(entityName: "ManagedUniversity")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var stateProvince: String?
    @NSManaged public var alphaTwoCode: String?
    @NSManaged public var domains: Data?
    @NSManaged public var webPages: Data?
}
