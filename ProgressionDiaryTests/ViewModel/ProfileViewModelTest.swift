import XCTest
import Combine
import SwiftyMocky
@testable import ProgressionDiary


class ProfileViewModelTest: XCTestCase {
    var state: ProfileViewState!
    var viewModel: ProfileViewModel!
    var mockAuthService: AuthServiceUseCaseMock!
    var mockSignOutSubject: PassthroughSubject<Void, AuthServiceError>!

    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        state = .init()
        mockAuthService = .init()
        mockSignOutSubject = .init()
        viewModel = .init(with: state, authService: mockAuthService)
    }

    override func tearDown() {
        state = nil
        mockAuthService = nil
        viewModel = nil
        mockSignOutSubject = nil
        cancellables = []

        super.tearDown()
    }

    func test_rightBarButtonDidTap_whenCalled_shouldInvokeAuthServiceSignout_souldUpdateisLoading() {
        // Given
        Given(mockAuthService, .signOut(willReturn: mockSignOutSubject.eraseToAnyPublisher()))

        // When
        viewModel.rightBarButtonDidTap()

        // Expect
        Verify(mockAuthService, 1, .signOut())
        XCTAssertTrue(state.isLoading)
    }

    func test_rightBarButtonDidTap_whenSignOutSuccess_shouldInvokeAuthServiceSignout_souldUpdateisLoading() {
        // Given
        Given(mockAuthService, .signOut(willReturn: mockSignOutSubject.eraseToAnyPublisher()))

        // When
        viewModel.rightBarButtonDidTap()
        mockSignOutSubject.send()

        // Expect
        Verify(mockAuthService, 1, .signOut())
        XCTAssertFalse(state.isLoading)
    }
}
