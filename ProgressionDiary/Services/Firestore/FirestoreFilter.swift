enum FirestoreFilter {
    case lessThan(field: String, value: Any)
    case lessThanOrEqual(field: String, value: Any)
    case equalTo(field: String, value: Any)
    case greaterThan(field: String, value: Any)
    case greaterThanOrEqual(field: String, value: Any)
    case notEqualTo(field: String, value: Any)
    case arrayContains(field: String, value: Any)
    case arrayContainsAny(field: String, value: [Any])
    case isIn(field: String, value: [Any])
    case notIn(field: String, value: [Any])
}
