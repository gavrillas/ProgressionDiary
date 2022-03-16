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


// MARK: - AppNavigatorUseCase

open class AppNavigatorUseCaseMock: AppNavigatorUseCase, Mock {
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
    public typealias DestinationType = AppNavigator.NavigationState
    public typealias Destination = EmptyView

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

    public var state: DestinationType? {
		get {	invocations.append(.p_state_get); return __p_state ?? optionalGivenGetterValue(.p_state_get, "AppNavigatorUseCaseMock - stub value for state was not defined") }
		set {	invocations.append(.p_state_set(.value(newValue))); __p_state = newValue }
	}
	private var __p_state: (DestinationType)?

    @ViewBuilder
		public var destination: Destination {
		get {	invocations.append(.p_destination_get); return __p_destination ?? givenGetterValue(.p_destination_get, "AppNavigatorUseCaseMock - stub value for destination was not defined") }
	}
	private var __p_destination: (Destination)?

    public var models: [DestinationType: Any] {
		get {	invocations.append(.p_models_get); return __p_models ?? givenGetterValue(.p_models_get, "AppNavigatorUseCaseMock - stub value for models was not defined") }
		set {	invocations.append(.p_models_set(.value(newValue))); __p_models = newValue }
	}
	private var __p_models: ([DestinationType: Any])?





    open func showAuthentication() {
        addInvocation(.m_showAuthentication)
		let perform = methodPerformValue(.m_showAuthentication) as? () -> Void
		perform?()
    }

    open func showDashboard() {
        addInvocation(.m_showDashboard)
		let perform = methodPerformValue(.m_showDashboard) as? () -> Void
		perform?()
    }

    open func inject<T>() -> T? {
        addInvocation(.m_inject)
		let perform = methodPerformValue(.m_inject) as? () -> Void
		perform?()
		var __value: T? = nil
		do {
		    __value = try methodReturnValue(.m_inject).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func navigate<T>(to destination: DestinationType, model: T? = nil) {
        addInvocation(.m_navigate__to_destinationmodel_model(Parameter<DestinationType>.value(`destination`), Parameter<T?>.value(`model`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_navigate__to_destinationmodel_model(Parameter<DestinationType>.value(`destination`), Parameter<T?>.value(`model`).wrapAsGeneric())) as? (DestinationType, T?) -> Void
		perform?(`destination`, `model`)
    }


    fileprivate enum MethodType {
        case m_showAuthentication
        case m_showDashboard
        case m_inject
        case m_navigate__to_destinationmodel_model(Parameter<DestinationType>, Parameter<GenericAttribute>)
        case p_state_get
		case p_state_set(Parameter<DestinationType?>)
        case p_destination_get
        case p_models_get
		case p_models_set(Parameter<[DestinationType: Any]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_showAuthentication, .m_showAuthentication): return .match

            case (.m_showDashboard, .m_showDashboard): return .match

            case (.m_inject, .m_inject): return .match

            case (.m_navigate__to_destinationmodel_model(let lhsDestination, let lhsModel), .m_navigate__to_destinationmodel_model(let rhsDestination, let rhsModel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsDestination, rhs: rhsDestination, with: matcher), lhsDestination, rhsDestination, "to destination"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsModel, rhs: rhsModel, with: matcher), lhsModel, rhsModel, "model"))
				return Matcher.ComparisonResult(results)
            case (.p_state_get,.p_state_get): return Matcher.ComparisonResult.match
			case (.p_state_set(let left),.p_state_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<DestinationType?>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            case (.p_destination_get,.p_destination_get): return Matcher.ComparisonResult.match
            case (.p_models_get,.p_models_get): return Matcher.ComparisonResult.match
			case (.p_models_set(let left),.p_models_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<[DestinationType: Any]>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_showAuthentication: return 0
            case .m_showDashboard: return 0
            case .m_inject: return 0
            case let .m_navigate__to_destinationmodel_model(p0, p1): return p0.intValue + p1.intValue
            case .p_state_get: return 0
			case .p_state_set(let newValue): return newValue.intValue
            case .p_destination_get: return 0
            case .p_models_get: return 0
			case .p_models_set(let newValue): return newValue.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_showAuthentication: return ".showAuthentication()"
            case .m_showDashboard: return ".showDashboard()"
            case .m_inject: return ".inject()"
            case .m_navigate__to_destinationmodel_model: return ".navigate(to:model:)"
            case .p_state_get: return "[get] .state"
			case .p_state_set: return "[set] .state"
            case .p_destination_get: return "[get] .destination"
            case .p_models_get: return "[get] .models"
			case .p_models_set: return "[set] .models"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func state(getter defaultValue: DestinationType?...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        @ViewBuilder
		public static func destination(getter defaultValue: Destination...) -> PropertyStub {
            return Given(method: .p_destination_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func models(getter defaultValue: [DestinationType: Any]...) -> PropertyStub {
            return Given(method: .p_models_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func inject<T>(willReturn: T?...) -> MethodStub {
            return Given(method: .m_inject, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func inject<T>(willProduce: (Stubber<T?>) -> Void) -> MethodStub {
            let willReturn: [T?] = []
			let given: Given = { return Given(method: .m_inject, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showAuthentication() -> Verify { return Verify(method: .m_showAuthentication)}
        public static func showDashboard() -> Verify { return Verify(method: .m_showDashboard)}
        public static func inject() -> Verify { return Verify(method: .m_inject)}
        public static func navigate<T>(to destination: Parameter<DestinationType>, model: Parameter<T?>) -> Verify { return Verify(method: .m_navigate__to_destinationmodel_model(`destination`, `model`.wrapAsGeneric()))}
        public static var state: Verify { return Verify(method: .p_state_get) }
		public static func state(set newValue: Parameter<DestinationType?>) -> Verify { return Verify(method: .p_state_set(newValue)) }
        public static var destination: Verify { return Verify(method: .p_destination_get) }
        public static var models: Verify { return Verify(method: .p_models_get) }
		public static func models(set newValue: Parameter<[DestinationType: Any]>) -> Verify { return Verify(method: .p_models_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showAuthentication(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showAuthentication, performs: perform)
        }
        public static func showDashboard(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showDashboard, performs: perform)
        }
        public static func inject(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_inject, performs: perform)
        }
        public static func navigate<T>(to destination: Parameter<DestinationType>, model: Parameter<T?>, perform: @escaping (DestinationType, T?) -> Void) -> Perform {
            return Perform(method: .m_navigate__to_destinationmodel_model(`destination`, `model`.wrapAsGeneric()), performs: perform)
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

    public var currentUserState: UserState {
		get {	invocations.append(.p_currentUserState_get); return __p_currentUserState ?? givenGetterValue(.p_currentUserState_get, "AuthServiceUseCaseMock - stub value for currentUserState was not defined") }
	}
	private var __p_currentUserState: (UserState)?

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
        case p_currentUserState_get
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
            case (.p_currentUserState_get,.p_currentUserState_get): return Matcher.ComparisonResult.match
            case (.p_userStateChangePublisher_get,.p_userStateChangePublisher_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_register__with_emailpassword_password(p0, p1): return p0.intValue + p1.intValue
            case let .m_signIn__with_emailpassword_password(p0, p1): return p0.intValue + p1.intValue
            case .m_signOut: return 0
            case .p_currentUserState_get: return 0
            case .p_userStateChangePublisher_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_register__with_emailpassword_password: return ".register(with:password:)"
            case .m_signIn__with_emailpassword_password: return ".signIn(with:password:)"
            case .m_signOut: return ".signOut()"
            case .p_currentUserState_get: return "[get] .currentUserState"
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

        public static func currentUserState(getter defaultValue: UserState...) -> PropertyStub {
            return Given(method: .p_currentUserState_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
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
        public static var currentUserState: Verify { return Verify(method: .p_currentUserState_get) }
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

