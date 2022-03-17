import XCTest
import SwiftyMocky
@testable import ProgressionDiary


class DashboardNavigatorTest: XCTestCase {
    var navigator: DashboardNavigator!

    override func setUp() {
        super.setUp()

        navigator = .init()
    }

    override func tearDown() {
        navigator = nil

        super.tearDown()
    }

    func test_showProfile_whenCalled_shouldUpdateState_shouldInitViewState() {
        // When
        navigator.showProfile()

        // Expect
        // print(type(of: navigator.destination))
        XCTAssertEqual(navigator.state, .profile)
        XCTAssertTrue(navigator.models[.profile] is ProfileViewState)
    }
}
