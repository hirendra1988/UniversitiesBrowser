# Universities Browser

A modular iOS application built using Swift, VIPER, Clean Architecture, and Swift Package Manager (SPM). The application fetches universities for a selected country, caches the results locally, and displays detailed information for each university.

## Demo

- **Platform**: iOS 15+
- **Language:** Swift
- **UI:** SwiftUI embedded inside `UIViewController` using `UIHostingController`
- **Navigation:** `UINavigationController`
- **Architecture:** VIPER + Clean Architecture
- **Concurrency:** `async/await`
- **Persistence:** Core Data
- **Dependency Management:** Swift Package Manager

---

## Features

- Display a list of universities from a remote API.
- Cache universities locally using Core Data.
- Load cached data when the network request fails.
- Show loading, empty, and error states.
- Navigate to a details screen without performing another API request.
- Refresh university data from the details screen.
- Reusable shared UI components across features.

---

## API

```
GET http://universities.hipolabs.com/search?country=United%20Arab%20Emirates
```

---

## Architecture

The project follows **VIPER** with **Clean Architecture** principles.

```
                   +------------------+
                   |   SwiftUI View   |
                   +------------------+
                            |
                            v
                   +------------------+
                   |    Presenter     |
                   +------------------+
                            |
                            v
                   +------------------+
                   |    Interactor    |
                   +------------------+
                            |
                            v
                   +------------------+
                   |   Repository     |
                   +------------------+
                      |            |
          +-----------+            +-----------+
          |                                    |
          v                                    v
+----------------------+          +----------------------+
|     NetworkKit       |          |   PersistenceKit     |
|  API / DTO / Client  |          |   Core Data Cache    |
+----------------------+          +----------------------+
```

Navigation is handled exclusively by the **Router** using `UINavigationController`.

---

## Project Structure

```
UniversitiesBrowser
│
├── UniversitiesBrowser (App Target)
│
└── Packages
    ├── DomainKit
    ├── NetworkKit
    ├── PersistenceKit
    ├── CommonUI
    ├── ListingFeature
    └── DetailsFeature
```

---

## Swift Packages

### DomainKit

Contains shared domain models used across all modules.

**Responsibilities**
- `University` domain model
- Shared business entities

---

### NetworkKit

Responsible for networking and API communication.

**Responsibilities**
- API client
- Request builder
- Endpoint definitions
- DTO mapping
- Response decoding
- Error handling

---

### PersistenceKit

Responsible for local persistence and caching.

**Responsibilities**
- Core Data stack
- Local storage
- Cache management
- Data mapping

---

### CommonUI

Contains reusable UI components shared between features.

**Examples**
- Loading view
- Error view
- Empty state view
- Common buttons and reusable components

---

### ListingFeature

Displays the list of universities.

**Responsibilities**
- Fetch universities
- Read/write local cache
- Display loading/error/empty states
- Navigate to details

---

### DetailsFeature

Displays details for the selected university.

**Responsibilities**
- Present university information
- Trigger refresh requests
- Remain independent of networking implementation

---

## Data Flow

### Initial Load

```
User
  │
  ▼
Listing Screen
  │
  ▼
Interactor
  │
  ▼
Repository
  │
  ├────────────► Network API
  │                    │
  │                    ▼
  │             Cache Response
  │
  ▼
Display Universities
```

### Network Failure

```
Repository
      │
      ▼
Network Error
      │
      ▼
Read Local Cache
      │
      ├────────────► Cache Available
      │                    │
      │                    ▼
      │             Display Cached Data
      │
      └────────────► Cache Empty
                           │
                           ▼
                    Show Error State
```

---

## Refresh Flow

```
Details Screen
      │
      ▼
Refresh Button
      │
      ▼
Listing Refresh Logic
      │
      ▼
Repository
      │
      ▼
Network API
      │
      ▼
Update Local Cache
      │
      ▼
Refresh UI
```

The Details module does **not** directly communicate with the networking layer.

---

## Error Handling

- API failures automatically fall back to cached data.
- If neither remote nor cached data is available, a reusable error view is displayed with a retry action.
- Loading and empty states are handled using shared components from `CommonUI`.

---

## Running the Project

## Prerequisites

- Xcode 16 or later
- iOS 15+
- Swift 6

## Setup Instructions

1. Clone the repository:

   ```bash
   git clone <repository-url>
   ```

2. Open `UniversitiesBrowser.xcodeproj` in Xcode.

3. If the local Swift packages are not resolved automatically, add them manually:

   - Select the `UniversitiesBrowser` project.
   - Open the `Package Dependencies` tab.
   - Click the `+` button.
   - Choose `Add Local...`.
   - Navigate to the `Packages` folder.
   - Add the following local packages:
     - DomainKit
     - NetworkKit
     - PersistenceKit
     - CommonUI
     - ListingFeature
     - DetailsFeature

4. Build the project.

5. Run the application on an iOS 15.1 or later simulator or device.


---

## Design Decisions

- VIPER is used to separate presentation, business logic, and navigation concerns.
- Clean Architecture keeps feature modules independent from infrastructure.
- Shared domain models live in `DomainKit` to avoid duplication.
- Networking and persistence are isolated into dedicated Swift Packages.
- SwiftUI is embedded inside `UIViewController` using `UIHostingController` to satisfy the UIKit navigation requirement.
- `async/await` is used for asynchronous operations.

---

## Future Enhancements

- Unit tests for presenters and repositories
- UI automation tests
- Search and filtering
- Pagination
- Dependency injection framework
- Offline synchronization improvements
- Analytics and logging

---

## Author

**Hirendra Sharma**
Senior iOS Developer
