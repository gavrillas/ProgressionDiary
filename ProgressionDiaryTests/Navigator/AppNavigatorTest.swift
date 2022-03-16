import XCTest
import SwiftyMocky
@testable import ProgressionDiary


class AppNavigatorTest: XCTestCase {
    var navigator: AppNavigator!

    override func setUp() {
        super.setUp()

        navigator = .init()
    }

    override func tearDown() {
        navigator = nil

        super.tearDown()
    }

    func test_showAuth_whenCalled_shouldUpdateStateToAuth_shouldInitViewState() {
        // When
        navigator.showAuthentication()

        // Expect
        XCTAssertEqual(navigator.state, .auth)
        XCTAssertTrue(navigator.models[.auth] is AuthenticationViewState)
    }

    func test_showDashboard_whenCalled_shouldUpdateState_shouldInitViewState() {
        // When
        navigator.showDashboard()

        // Expect
        XCTAssertEqual(navigator.state, .dashboard)
        XCTAssertTrue(navigator.models[.dashboard] is DashboardViewState)
    }
}
