import XCTest
import Combine
import SwiftyMocky
@testable import ProgressionDiary


class AuthhenticationViewModelTest: XCTestCase {
    var state: AuthenticationViewState!
    var viewModel: AuthenticationViewModel!
    var mockAuthService: AuthServiceUseCaseMock!
    var mockLoginSubject: PassthroughSubject<Void, AuthServiceError>!

    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        state = .init()
        mockAuthService = .init()
        mockLoginSubject = .init()
        viewModel = .init(with: state, authService: mockAuthService)
    }

    override func tearDown() {
        state = nil
        mockAuthService = nil
        viewModel = nil
        mockLoginSubject = nil
        cancellables = []

        super.tearDown()
    }

    func test_buttonDidTap_whenLogin_shouldInvokeAuthServiceLogin_shouldUpdateIsLoading() {
        // Given
        Given(mockAuthService,
              .signIn(with: .any,
                      password: .any,
                      willReturn: mockLoginSubject.eraseToAnyPublisher()))

        // When
        viewModel.buttonDidTap()

        // Expect
        Verify(mockAuthService,
               1,
               .signIn(with: .value(state.email),
                       password: .value(state.password)))
        XCTAssertTrue(state.isLoaing)
    }

    func test_buttonDidTap_whenLoginSuccess_shouldInvokeAuthServiceLogin_shouldUpdateIsLoading() {
        // Given
        Given(mockAuthService,
              .signIn(with: .any,
                      password: .any,
                      willReturn: mockLoginSubject.eraseToAnyPublisher()))

        // When
        viewModel.buttonDidTap()
        mockLoginSubject.send()

        // Expect
        XCTAssertFalse(state.isLoaing)
    }
}
