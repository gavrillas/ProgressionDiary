import XCTest
import Combine
import SwiftyMocky
@testable import ProgressionDiary


class DashboardViewModelTest: XCTestCase {
    var state: DashboardViewState!
    var mockNavigator: DashboardNavigatorUseCaseMock!
    var viewModel: DashboardViewModel<DashboardNavigatorUseCaseMock>!

    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        state = .init()
        mockNavigator = .init()
        viewModel = .init(with: mockNavigator, state: state)
    }

    override func tearDown() {
        state = nil
        mockNavigator = nil
        viewModel = nil
        cancellables = []

        super.tearDown()
    }

    func test_rightBarButtonDidTap_whenCalled_shouldInvokeNavigatorShowProfile() {
        // When
        viewModel.rightBarButtonDidTap()

        // Expect
        Verify(mockNavigator, 1, .showProfile())
    }
}
