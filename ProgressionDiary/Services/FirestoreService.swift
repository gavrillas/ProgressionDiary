import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

enum FirestoreCollection: String {
    case user
}

enum FirestoreError: Error {
    case noInternet
    case couldNotFetchData
    case couldNotObserveData
    case couldNotSaveData
    case couldNotParseData
}

// sourcery: AutoMockable
protocol FirestoreServiceUseCase {
    func saveData<T: Codable>(to collection: FirestoreCollection, for document: String?, data: T) -> AnyPublisher<Void, FirestoreError>
    func getData<T: Codable>(from collection: FirestoreCollection, for document: String, data: T) -> AnyPublisher<T, FirestoreError>
    func listenChanges<T: Codable>(in collection: FirestoreCollection, for document: String) -> AnyPublisher<T, FirestoreError>
}


final class FirestoreService: FirestoreServiceUseCase {
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?

    deinit {
        listener?.remove()
    }

    func saveData<T: Codable>(to collection: FirestoreCollection, for document: String?, data: T) -> AnyPublisher<Void, FirestoreError> {
        Future<Void, FirestoreError> { [weak db] promise in
            do {
                let collectionRef = db?.collection(collection.rawValue)
                let documentRef = document == nil ? collectionRef?.document() : collectionRef?.document(document!)
                try documentRef?.setData(from: data)
                promise(.success(()))
            } catch let error {
                let errorValue: FirestoreError = error.isNoInternetError ? .noInternet : .couldNotSaveData
                promise(.failure(errorValue))
            }
        }.eraseToAnyPublisher()
    }

    func getData<T: Codable>(from collection: FirestoreCollection, for document: String, data: T) -> AnyPublisher<T, FirestoreError> {
        Future<T, FirestoreError> { [weak db] promise in
            db?.collection(collection.rawValue)
                .document(document)
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

    func listenChanges<T: Codable>(in collection: FirestoreCollection, for document: String) -> AnyPublisher<T, FirestoreError> {
        let subject = PassthroughSubject<T, FirestoreError>()
        listener = db.collection(collection.rawValue)
            .document(document)
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
