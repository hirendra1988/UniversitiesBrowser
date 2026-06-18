import DomainKit

public final class UniversitiesAPIService: UniversitiesAPIServiceProtocol {

    private let client: APIClient

    public init(client: APIClient = URLSessionAPIClient()) {
        self.client = client
    }

    public func fetchUniversities(country: String) async throws -> [University] {

        let endpoint = UniversitiesEndpoint.search(country: country)

        let request = try RequestBuilder.makeRequest(
            endpoint: endpoint,
            configuration: .universities
        )

        let dto: [UniversityDTO] = try await client.request(request)

        return dto.map { $0.toDomain() }
    }
}
