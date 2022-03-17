import XCTest
import Combine
import SwiftyMocky
@testable import ProgressionDiary

class AppViewModelTest: XCTestCase {
    // MARK: - Mocks
    var mockNavigator: AppNavigatorUseCaseMock!
    var mockAuthSerivce: AuthServiceUseCaseMock!
    var mockUserStateSubject: PassthroughSubject<UserState, Never>!

    // MARK: - SUT
    var viewModel: AppViewModel<AppNavigatorUseCaseMock>!

    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        mockNavigator = .init()
        mockAuthSerivce = .init()
        mockUserStateSubject = .init()
    }

    override func tearDown() {
        mockNavigator = nil
        viewModel = nil
        mockAuthSerivce = nil
        mockUserStateSubject = nil
        cancellables = []

        super.tearDown()
    }

    // MARK: - Test cases

    func test_appStateChange_whenUserLogin_shouldInvokeNavigatorShowDashboard() {
        // Given
        Given(mockAuthSerivce, .currentUserState(getter: .loggedOut))
        Given(mockAuthSerivce,
              .userStateChangePublisher(getter: mockUserStateSubject.eraseToAnyPublisher()))

        viewModel = .init(with: mockNavigator, authService: mockAuthSerivce)

        mockNavigator.resetMock()

        // When
        mockUserStateSubject.send(.loggedIn)

        // Expect
        Verify(mockNavigator, 1, .showDashboard())
        Verify(mockNavigator, .never, .showAuthentication())
    }

    func test_appStateChange_whenUserLogOut_shouldInvokeNavigatorShowAuthentication() {
        // Given
        Given(mockAuthSerivce, .currentUserState(getter: .loggedIn))
        Given(mockAuthSerivce,
              .userStateChangePublisher(getter: mockUserStateSubject.eraseToAnyPublisher()))

        viewModel = .init(with: mockNavigator, authService: mockAuthSerivce)

        mockNavigator.resetMock()

        // When
        mockUserStateSubject.send(.loggedOut)

        // Expect
        Verify(mockNavigator, .never, .showDashboard())
        Verify(mockNavigator, 1, .showAuthentication())
    }

    func test_userStateCheckAtStart_whenUserLoggedIn_shouldInvokeNavigatorShowDashboard() {
        // Given
        Given(mockAuthSerivce, .currentUserState(getter: .loggedIn))
        Given(mockAuthSerivce,
              .userStateChangePublisher(getter: mockUserStateSubject.eraseToAnyPublisher()))

        // When
        viewModel = .init(with: mockNavigator, authService: mockAuthSerivce)

        // Expect
        Verify(mockNavigator, 1, .showDashboard())
        Verify(mockNavigator, .never, .showAuthentication())
    }

    func test_userStateCheckAtStart_whenUserLoggedOut_shouldInvokeNavigatorShowAuthentication() {
        // Given
        Given(mockAuthSerivce, .currentUserState(getter: .loggedOut))
        Given(mockAuthSerivce,
              .userStateChangePublisher(getter: mockUserStateSubject.eraseToAnyPublisher()))

        // When
        viewModel = .init(with: mockNavigator, authService: mockAuthSerivce)

        // Expect
        Verify(mockNavigator, .never, .showDashboard())
        Verify(mockNavigator, 1, .showAuthentication())
    }
}
