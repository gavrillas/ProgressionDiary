import Foundation

extension Error {
    var isNoInternetError: Bool {
        if type(of: self) is NSError.Type {
            let error = self as NSError
            return error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet
        }
        return false
    }
}
