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

    func test_showAuth_whenCalled_shouldUpdateStateToAuth() {
        // When
        navigator.showAuthentication()

        // Expect
        XCTAssertEqual(navigator.state, .auth)
        XCTAssertTrue(navigator.models[.auth] is AuthenticationViewState)
    }
}
