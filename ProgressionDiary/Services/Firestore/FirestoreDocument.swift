struct FirestoreDocument {
    let collections: [FirestoreCollection]
    let documents: [String]

    var path: String {
        zip(collections, documents).map { (collection, document) in
            "\(collection.rawValue)/\(document)"
        }.joined(separator: "/")
    }
}
