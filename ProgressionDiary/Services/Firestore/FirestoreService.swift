import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

enum FirestoreError: Error {
    case noInternet
    case couldNotFetchData
    case couldNotObserveData
    case couldNotSaveData
    case couldNotParseData
}

// sourcery: AutoMockable
protocol FirestoreServiceUseCase {
    func saveData<T: Codable>(to document: FirestoreDocument, data: T) -> AnyPublisher<Void, FirestoreError>
    func saveData<T: Codable>(to collection: FirestoreCollection, data: T) -> AnyPublisher<Void, FirestoreError>
    func getData<T: Codable>(for document: FirestoreDocument) -> AnyPublisher<T, FirestoreError>
    func getData<T: Codable>(from collection: FirestoreCollection,
                             filters: [FirestoreFilter],
                             limit: Int?,
                             orderBy: String?,
                             desc: Bool) -> AnyPublisher<[T], FirestoreError>
    func listenChanges<T: Codable>(for document: FirestoreDocument) -> AnyPublisher<T, FirestoreError>
}


final class FirestoreService: FirestoreServiceUseCase {
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?

    deinit {
        listener?.remove()
    }

    func saveData<T: Codable>(to document: FirestoreDocument, data: T) -> AnyPublisher<Void, FirestoreError> {
        Future<Void, FirestoreError> { [weak db] promise in
            do {
                try db?.document(document.path).setData(from: data)
                promise(.success(()))
            } catch let error {
                let errorValue: FirestoreError = error.isNoInternetError ? .noInternet : .couldNotSaveData
                promise(.failure(errorValue))
            }
        }.eraseToAnyPublisher()
    }

    func saveData<T: Codable>(to collection: FirestoreCollection, data: T) -> AnyPublisher<Void, FirestoreError> {
        Future<Void, FirestoreError> { [weak db] promise in
            do {
                try db?.document(collection.rawValue).setData(from: data)
                promise(.success(()))
            } catch let error {
                let errorValue: FirestoreError = error.isNoInternetError ? .noInternet : .couldNotSaveData
                promise(.failure(errorValue))
            }
        }.eraseToAnyPublisher()
    }

    func getData<T: Codable>(for document: FirestoreDocument) -> AnyPublisher<T, FirestoreError> {
        Future<T, FirestoreError> { [weak db] promise in
            db?.document(document.path)
                .getDocument(as: T.self) { result in
                    switch result {
                    case .success(let data):
                        promise(.success(data))
                    case .failure(let error):
                        let errorValue: FirestoreError = error.isNoInternetError ? .noInternet : .couldNotFetchData
                        promise(.failure(errorValue))
                    }
                }
        }.eraseToAnyPublisher()
    }

    func getData<T: Codable>(from collection: FirestoreCollection,
                             filters: [FirestoreFilter] = [],
                             limit: Int? = nil,
                             orderBy: String? = nil,
                             desc: Bool = true) -> AnyPublisher<[T], FirestoreError> {
        Future<[T], FirestoreError> { [weak db] promise in
            var query = db?.collection(collection.rawValue)
                .applyFilters(filters: filters)

            if let limit = limit {
                query = query?.limit(to: limit)
            }

            if let orderBy = orderBy {
                query = query?.order(by: orderBy, descending: desc)
            }

            query?.getDocuments() { documentSnapshot, error in
                guard let document = documentSnapshot?.documents else {
                    let errorValue: FirestoreError = error?.isNoInternetError ?? false ? .noInternet : .couldNotFetchData
                    promise(.failure(errorValue))
                    return
                }

                do {
                    let objects = try document.map { try $0.data(as: T.self) }
                    promise(.success(objects))
                } catch {
                    promise( .failure(.couldNotParseData))
                }
            }

        }.eraseToAnyPublisher()
    }

    func listenChanges<T: Codable>(for document: FirestoreDocument) -> AnyPublisher<T, FirestoreError> {
        let subject = PassthroughSubject<T, FirestoreError>()
        listener = db.document(document.path)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    let errorValue: FirestoreError = error?.isNoInternetError ?? false ? .noInternet : .couldNotFetchData
                    subject.send(completion: .failure(errorValue))
                    return
                }

                do {
                    let object = try document.data(as: T.self)
                    subject.send(object)
                } catch {
                    subject.send(completion: .failure(.couldNotParseData))
                }
            }
        return subject.eraseToAnyPublisher()
    }
}

private extension Query {
    func applyFilter(filter: FirestoreFilter) -> Query {
        switch filter {
        case .lessThan(let field, let value):
            return self.whereField(field, isLessThan: value)
        case .lessThanOrEqual(let field, let value):
            return self.whereField(field, isLessThanOrEqualTo: value)
        case .equalTo(let field, let value):
            return self.whereField(field, isEqualTo: value)
        case .greaterThan(let field, let value):
            return self.whereField(field, isGreaterThan: value)
        case .greaterThanOrEqual(let field, let value):
            return self.whereField(field, isGreaterThanOrEqualTo: value)
        case .notEqualTo(let field, let value):
            return self.whereField(field, isNotEqualTo: value)
        case .arrayContains(let field, let value):
            return self.whereField(field, arrayContains: value)
        case .arrayContainsAny(let field, let value):
            return self.whereField(field, arrayContainsAny: value)
        case .isIn(let field, let value):
            return self.whereField(field, in: value)
        case .notIn(let field, let value):
            return self.whereField(field, notIn: value)
        }
    }

    func applyFilters(filters: [FirestoreFilter]) -> Query {
        var query = self
        filters.forEach { filter in
            query = query.applyFilter(filter: filter)
        }
        return query
    }
}
