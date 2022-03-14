// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Combine
import Foundation
import SwiftUI
@testable import ProgressionDiary


// MARK: - AuthServiceUseCase

open class AuthServiceUseCaseMock: AuthServiceUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var userStateChangePublisher: AnyPublisher<UserState, Never> {
		get {	invocations.append(.p_userStateChangePublisher_get); return __p_userStateChangePublisher ?? givenGetterValue(.p_userStateChangePublisher_get, "AuthServiceUseCaseMock - stub value for userStateChangePublisher was not defined") }
	}
	private var __p_userStateChangePublisher: (AnyPublisher<UserState, Never>)?





    open func register(with email: String, password: String) -> AnyPublisher<Void, AuthServiceError> {
        addInvocation(.m_register__with_emailpassword_password(Parameter<String>.value(`email`), Parameter<String>.value(`password`)))
		let perform = methodPerformValue(.m_register__with_emailpassword_password(Parameter<String>.value(`email`), Parameter<String>.value(`password`))) as? (String, String) -> Void
		perform?(`email`, `password`)
		var __value: AnyPublisher<Void, AuthServiceError>
		do {
		    __value = try methodReturnValue(.m_register__with_emailpassword_password(Parameter<String>.value(`email`), Parameter<String>.value(`password`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for register(with email: String, password: String). Use given")
			Failure("Stub return value not specified for register(with email: String, password: String). Use given")
		}
		return __value
    }

    open func signIn(with email: String, password: String) -> AnyPublisher<Void, AuthServiceError> {
        addInvocation(.m_signIn__with_emailpassword_password(Parameter<String>.value(`email`), Parameter<String>.value(`password`)))
		let perform = methodPerformValue(.m_signIn__with_emailpassword_password(Parameter<String>.value(`email`), Parameter<String>.value(`password`))) as? (String, String) -> Void
		perform?(`email`, `password`)
		var __value: AnyPublisher<Void, AuthServiceError>
		do {
		    __value = try methodReturnValue(.m_signIn__with_emailpassword_password(Parameter<String>.value(`email`), Parameter<String>.value(`password`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for signIn(with email: String, password: String). Use given")
			Failure("Stub return value not specified for signIn(with email: String, password: String). Use given")
		}
		return __value
    }

    open func signOut() -> AnyPublisher<Void, AuthServiceError> {
        addInvocation(.m_signOut)
		let perform = methodPerformValue(.m_signOut) as? () -> Void
		perform?()
		var __value: AnyPublisher<Void, AuthServiceError>
		do {
		    __value = try methodReturnValue(.m_signOut).casted()
		} catch {
			onFatalFailure("Stub return value not specified for signOut(). Use given")
			Failure("Stub return value not specified for signOut(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_register__with_emailpassword_password(Parameter<String>, Parameter<String>)
        case m_signIn__with_emailpassword_password(Parameter<String>, Parameter<String>)
        case m_signOut
        case p_userStateChangePublisher_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_register__with_emailpassword_password(let lhsEmail, let lhsPassword), .m_register__with_emailpassword_password(let rhsEmail, let rhsPassword)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsEmail, rhs: rhsEmail, with: matcher), lhsEmail, rhsEmail, "with email"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPassword, rhs: rhsPassword, with: matcher), lhsPassword, rhsPassword, "password"))
				return Matcher.ComparisonResult(results)

            case (.m_signIn__with_emailpassword_password(let lhsEmail, let lhsPassword), .m_signIn__with_emailpassword_password(let rhsEmail, let rhsPassword)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsEmail, rhs: rhsEmail, with: matcher), lhsEmail, rhsEmail, "with email"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPassword, rhs: rhsPassword, with: matcher), lhsPassword, rhsPassword, "password"))
				return Matcher.ComparisonResult(results)

            case (.m_signOut, .m_signOut): return .match
            case (.p_userStateChangePublisher_get,.p_userStateChangePublisher_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_register__with_emailpassword_password(p0, p1): return p0.intValue + p1.intValue
            case let .m_signIn__with_emailpassword_password(p0, p1): return p0.intValue + p1.intValue
            case .m_signOut: return 0
            case .p_userStateChangePublisher_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_register__with_emailpassword_password: return ".register(with:password:)"
            case .m_signIn__with_emailpassword_password: return ".signIn(with:password:)"
            case .m_signOut: return ".signOut()"
            case .p_userStateChangePublisher_get: return "[get] .userStateChangePublisher"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func userStateChangePublisher(getter defaultValue: AnyPublisher<UserState, Never>...) -> PropertyStub {
            return Given(method: .p_userStateChangePublisher_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func register(with email: Parameter<String>, password: Parameter<String>, willReturn: AnyPublisher<Void, AuthServiceError>...) -> MethodStub {
            return Given(method: .m_register__with_emailpassword_password(`email`, `password`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func signIn(with email: Parameter<String>, password: Parameter<String>, willReturn: AnyPublisher<Void, AuthServiceError>...) -> MethodStub {
            return Given(method: .m_signIn__with_emailpassword_password(`email`, `password`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func signOut(willReturn: AnyPublisher<Void, AuthServiceError>...) -> MethodStub {
            return Given(method: .m_signOut, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func register(with email: Parameter<String>, password: Parameter<String>, willProduce: (Stubber<AnyPublisher<Void, AuthServiceError>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<Void, AuthServiceError>] = []
			let given: Given = { return Given(method: .m_register__with_emailpassword_password(`email`, `password`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<Void, AuthServiceError>).self)
			willProduce(stubber)
			return given
        }
        public static func signIn(with email: Parameter<String>, password: Parameter<String>, willProduce: (Stubber<AnyPublisher<Void, AuthServiceError>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<Void, AuthServiceError>] = []
			let given: Given = { return Given(method: .m_signIn__with_emailpassword_password(`email`, `password`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<Void, AuthServiceError>).self)
			willProduce(stubber)
			return given
        }
        public static func signOut(willProduce: (Stubber<AnyPublisher<Void, AuthServiceError>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<Void, AuthServiceError>] = []
			let given: Given = { return Given(method: .m_signOut, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<Void, AuthServiceError>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func register(with email: Parameter<String>, password: Parameter<String>) -> Verify { return Verify(method: .m_register__with_emailpassword_password(`email`, `password`))}
        public static func signIn(with email: Parameter<String>, password: Parameter<String>) -> Verify { return Verify(method: .m_signIn__with_emailpassword_password(`email`, `password`))}
        public static func signOut() -> Verify { return Verify(method: .m_signOut)}
        public static var userStateChangePublisher: Verify { return Verify(method: .p_userStateChangePublisher_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func register(with email: Parameter<String>, password: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
            return Perform(method: .m_register__with_emailpassword_password(`email`, `password`), performs: perform)
        }
        public static func signIn(with email: Parameter<String>, password: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
            return Perform(method: .m_signIn__with_emailpassword_password(`email`, `password`), performs: perform)
        }
        public static func signOut(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_signOut, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

