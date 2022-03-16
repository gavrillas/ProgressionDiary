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
}
