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
        state.selectedSegment = .login
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
        state.selectedSegment = .login
        viewModel.buttonDidTap()
        mockLoginSubject.send()

        // Expect
        Verify(mockAuthService,
               1,
               .signIn(with: .value(state.email),
                       password: .value(state.password)))
        XCTAssertFalse(state.isLoaing)
    }

    func test_buttonDidTap_whenRegister_shouldInvokeAuthServiceRegister_shouldUpdateIsLoading() {
        // Given
        Given(mockAuthService,
              .register(with: .any,
                      password: .any,
                      willReturn: mockLoginSubject.eraseToAnyPublisher()))

        // When
        state.selectedSegment = .register
        viewModel.buttonDidTap()

        // Expect
        Verify(mockAuthService,
               1,
               .register(with: .value(state.email),
                         password: .value(state.password)))
        XCTAssertTrue(state.isLoaing)
    }

    func test_buttonDidTap_whenRegisterSuccess_shouldInvokeAuthServiceRegister_shouldUpdateIsLoading() {
        // Given
        Given(mockAuthService,
              .register(with: .any,
                      password: .any,
                      willReturn: mockLoginSubject.eraseToAnyPublisher()))

        // When
        state.selectedSegment = .register
        viewModel.buttonDidTap()
        mockLoginSubject.send()

        // Expect
        Verify(mockAuthService,
               1,
               .register(with: .value(state.email),
                         password: .value(state.password)))
        XCTAssertFalse(state.isLoaing)
    }

    func test_buttonEnableState_whenEmailFormIsNotValid_shouldBeDisabled() {
        // When
        state.email = "asd"

        // Expect
        XCTAssertTrue(state.isButtonDisabled)
    }

    func test_buttonEnableState_whenEmailFormIsValidButPasswordIsEmpty_shouldBeDisabled() {
        // When
        state.email = "gavrillas.kristof@gmail.com"
        state.password = ""

        // Expect
        XCTAssertTrue(state.isButtonDisabled)
    }

    func test_buttonEnableState_whenRegisterAndPasswordConfirmEmpty_shouldBeDisabled() {
        // when
        state.selectedSegment = .register
        state.email = "gavrillas.kristof@gmail.com"
        state.password = "Test1234"
        state.passwordConfirm = ""

        // Expect
        XCTAssertTrue(state.isButtonDisabled)
    }

    func test_buttonEnableState_whenLoginAndPasswordConfirmEmptyButEmailPasswordAreGood_shouldBeEnabled() {
        // when
        state.selectedSegment = .login
        state.email = "gavrillas.kristof@gmail.com"
        state.password = "Test1234"
        state.passwordConfirm = ""

        // Expect
        XCTAssertFalse(state.isButtonDisabled)
    }

    func test_buttonEnableState_whenRegisterAndPasswordsAreDifferent_shouldBeDisabled() {
        // when
        state.selectedSegment = .register
        state.email = "gavrillas.kristof@gmail.com"
        state.password = "Test1234"
        state.passwordConfirm = "1245"

        // Expect
        XCTAssertTrue(state.isButtonDisabled)
    }

    func test_buttonEnableState_whenRegisterAndPasswordsAreDifferent_shouldBeEnabled() {
        // when
        state.selectedSegment = .login
        state.email = "gavrillas.kristof@gmail.com"
        state.password = "Test1234"
        state.passwordConfirm = "1245"

        // Expect
        XCTAssertFalse(state.isButtonDisabled)
    }
}
